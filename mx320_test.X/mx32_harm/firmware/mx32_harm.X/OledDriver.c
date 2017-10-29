/************************************************************************/
/*										*/
/*	OledDriver.c	-- Graphics Driver Library for OLED Display		*/
/*										*/
/************************************************************************/
/*	Author: 	Gene Apperson						*/
/*	Copyright 2011, Digilent Inc.						*/
/************************************************************************/
/*
  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */
/************************************************************************/
/*  Module Description: 							*/
/*										*/
/*	This is part of the device driver software for the OLED bit mapped	*/
/*	display on the Digilent Basic I/O Shield. This module contains the	*/
/*	initialization functions and basic display control functions.		*/
/*										*/
/************************************************************************/
/*  Revision History:								*/
/*										*/
/*	04/29/2011(GeneA): Created						*/
/*	08/03/2011(GeneA): added functions to shut down the display and to	*/
/*		turn the display on and off.					*/
/*	01/04/2012(GeneA): Changed use of DelayMs to using standard delay	*/
/*		function. Removed delay.h					*/
/*	05/11/2017(FGB): convert XC32 and Harmony 2.0				*/
/*										*/
/************************************************************************/


/* ------------------------------------------------------------ */
/*				Include File Definitions	*/
/* ------------------------------------------------------------ */

#include <p32xxxx.h>

#include "OledDriver.h"
#include "OledChar.h"
#include "OledGrph.h"
#include "app.h"

/* ------------------------------------------------------------ */
/*				Local Symbol Definitions						*/
/* ------------------------------------------------------------ */

enum {
	cmdOledDisplayOn = 0xAF,
	cmdOledDisplayOff = 0xAE,
	cmdOledSegRemap = 0xA1,		//map column 127 to SEG0
	cmdOledComDir = 0xC8,		//scan from COM[N-1] to COM0
	cmdOledComConfig = 0xDA,	//set COM hardware configuration
	cmdOledComSeqLR = 0x20		//sequential COM, left/right remap enabled
};

enum {
	d_seq_single_width = 1, d_seq_one_width = 4, d_seq_two_width = 5
}; // command byte-width sizes

struct oled_init_data {
	uint32_t init_delay_msecs;
	uint8_t d_off[d_seq_single_width];
	uint8_t d_on[d_seq_single_width];
	uint8_t d_charge_setup[d_seq_one_width];
	uint8_t d_origin_memory[d_seq_two_width];
};

static const struct oled_init_data oled_ssd1306 = {
	.init_delay_msecs = 100,
	.d_off = {cmdOledDisplayOff},
	.d_on = {cmdOledDisplayOn},
	.d_charge_setup = {0x8D, 0x14, 0xD9, 0xF1}, //Send the Set Charge Pump and Set Pre-Charge Period commands
	.d_origin_memory = {cmdOledSegRemap, cmdOledComDir, cmdOledComConfig, cmdOledComSeqLR, cmdOledDisplayOn},
};

const struct oled_init_data *oled_ptr = &oled_ssd1306;

/* ------------------------------------------------------------ */
/*				Global Variables								*/
/* ------------------------------------------------------------ */

extern uint8_t rgbOledFont0[];
extern uint8_t rgbOledFontUser[];
extern uint8_t rgbFillPat[];

extern int32_t xchOledMax;
extern int32_t ychOledMax;

/* Coordinates of current pixel location on the display. The origin
 ** is at the upper left of the display. X increases to the right
 ** and y increases going down.
 */
int32_t xcoOledCur;
int32_t ycoOledCur;

uint8_t * pbOledCur; //address of byte corresponding to current location
int32_t bnOledCur; //bit number of bit corresponding to current location
uint8_t clrOledCur; //drawing color to use
uint8_t * pbOledPatCur; //current fill pattern
int32_t fOledCharUpdate;

int32_t dxcoOledFontCur;
int32_t dycoOledFontCur;

uint8_t * pbOledFontCur;
uint8_t * pbOledFontUser;

/* ------------------------------------------------------------ */
/*				Local Variables									*/
/* ------------------------------------------------------------ */

/* This array is the offscreen frame buffer used for rendering.
 ** It isn't possible to read back frome the OLED display device,
 ** so display data is rendered into this offscreen buffer and then
 ** copied to the display.
 */
uint8_t rgbOledBmp[cbOledDispMax];

// Harmony SPI Driver
static DRV_HANDLE SPIHandle;

/* ------------------------------------------------------------ */
/*				Forward Declarations							*/
/* ------------------------------------------------------------ */

void OledHostInit();
void OledHostTerm();
void OledDevInit();
void OledDevTerm();
void OledDvrInit();
void OledPutBuffer(int32_t cb, uint8_t * rgbTx);

#define READ_CORE_TIMER()                 _CP0_GET_COUNT()          // Read the MIPS Core Timer

void BSP_DelayUs(uint32_t microseconds)
{
	uint32_t time;

	time = READ_CORE_TIMER(); // Read Core Timer    
	time += (SYS_CLK_FREQ / 2 / 1000000) * microseconds; // calc the Stop Time    
	while ((int32_t) (time - READ_CORE_TIMER()) > 0) { // busy wait
	};
}

void DelayMs(uint32_t delay)
{
	BSP_DelayUs(delay * 1000);
}

/* ------------------------------------------------------------ */
/*				Procedure Definitions							*/
/* ------------------------------------------------------------ */

/***	OledInit
 **
 **	Parameters:
 **		none
 **
 **	Return Value:
 **		none
 **
 **	Errors:
 **		none
 **
 **	Description:
 **		Initialize the OLED display subsystem.
 */

void OledInit(void)
{
	/* Init the PIC32 peripherals used to talk to the display.
	 */
	OledHostInit();

	/* Init the memory variables used to control access to the
	 ** display.
	 */
	OledDvrInit();

	/* Init the OLED display hardware.
	 */
	OledDevInit();

	/* Clear the display.
	 */
	OledClear();

}

/* ------------------------------------------------------------ */

/***	OledTerm
 **
 **	Parameters:
 **		none
 **
 **	Return Value:
 **		none
 **
 **	Errors:
 **		none
 **
 **	Description:
 **		Shut down the OLED display.
 */

void OledTerm(void)
{

	/* Shut down the OLED display hardware.
	 */
	OledDevTerm();

	/* Release the PIC32 peripherals being used.
	 */
	OledHostTerm();

}

/* ------------------------------------------------------------ */

/***	OledHostInit
 **
 **	Parameters:
 **		none
 **
 **	Return Value:
 **		none
 **
 **	Errors:
 **		none
 **
 **	Description:
 **		Perform PIC32 device initialization to prepare for use
 **		of the OLED display.
 */

void OledHostInit(void)
{
	/*
	 OLED control and display power off, no CS select pin means SPI always talks to display 
	 */
	prtVddCtrl = 1;
	prtVbatCtrl = 1;
	prtDataCmd = 0;
	prtReset = 1;

	/* configure display hardware for SPI data */
	prtDataCmd = 0;
	prtVddCtrl = 0;
	DelayMs(1);
	SPIHandle = DRV_SPI_Open(DRV_SPI_INDEX_0, DRV_IO_INTENT_WRITE);
}

/* ------------------------------------------------------------ */

/***	OledHostTerm
 **
 **	Parameters:
 **		none
 **
 **	Return Value:
 **		none
 **
 **	Errors:
 **		none
 **
 **	Description:
 **		Release processor resources used by the library
 */

void OledHostTerm(void)
{
	// does nothing, the display and SPI port remains active
}

/* ------------------------------------------------------------ */

/***	OledDvrInit
 **
 **	Parameters:
 **		none
 **
 **	Return Value:
 **		none
 **
 **	Errors:
 **		none
 **
 **	Description:
 **		Initialize the OLED software system
 */

void OledDvrInit(void)
{
	int32_t ib;

	/* Init the parameters for the default font
	 */
	dxcoOledFontCur = cbOledChar;
	dycoOledFontCur = 8;
	pbOledFontCur = rgbOledFont0;
	pbOledFontUser = rgbOledFontUser;

	for (ib = 0; ib < cbOledFontUser; ib++) {
		rgbOledFontUser[ib] = 0;
	}

	xchOledMax = ccolOledMax / dxcoOledFontCur;
	ychOledMax = crowOledMax / dycoOledFontCur;

	/* Set the default character cursor position.
	 */
	OledSetCursor(0, 0);

	/* Set the default foreground draw color and fill pattern
	 */
	clrOledCur = 0x01;
	pbOledPatCur = rgbFillPat;
	OledSetDrawMode(modOledSet);

	/* Default the character routines to automatic
	 ** update the display.
	 */
	fOledCharUpdate = 1;

}

/* ------------------------------------------------------------ */

/***	OledDevInit
 **
 **	Parameters:
 **		none
 **
 **	Return Value:
 **		none
 **
 **	Errors:
 **		none
 **
 **	Description:
 **		Initialize the OLED display controller and turn the display on.
 */

void OledDevInit(void)
{
	DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) oled_ssd1306.d_off, sizeof(oled_ssd1306.d_off), 0, 0);
	prtReset = 0;
	DelayMs(1);
	prtReset = 1;
	DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) oled_ssd1306.d_charge_setup, sizeof(oled_ssd1306.d_charge_setup), 0, 0);
	prtVbatCtrl = 0;
	DelayMs(oled_ssd1306.init_delay_msecs);
	DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) oled_ptr->d_origin_memory, d_seq_two_width, 0, 0);
}

/* ------------------------------------------------------------ */

/***	OledDevTerm
 **
 **	Parameters:
 **		none
 **
 **	Return Value:
 **		none
 **
 **	Errors:
 **		none
 **
 **	Description:
 **		Shut down the OLED display hardware
 */

void OledDevTerm(void)
{
	/* Send the Display Off command.
	 */
	prtDataCmd = 0;
	DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) oled_ssd1306.d_off, sizeof(oled_ssd1306.d_off), 0, 0);

	/* Turn off VCC
	 */
	prtVbatCtrl = 1;
	DelayMs(oled_ssd1306.init_delay_msecs);

	/* Turn off VDD
	 */
	prtVddCtrl = 1;
}

/* ------------------------------------------------------------ */

/***	OledDisplayOn
 **
 **	Parameters:
 **		none
 **
 **	Return Value:
 **		none
 **
 **	Errors:
 **		none
 **
 **	Description:
 **		Turn the display on. This assumes that the display has
 **		already been powered on and initialized. All it does
 **		is send the display on command.
 */

void OledDisplayOn(void)
{
	prtDataCmd = 0;
	DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) oled_ssd1306.d_on, sizeof(oled_ssd1306.d_on), 0, 0);
}

/* ------------------------------------------------------------ */

/***	OledDisplayOff
 **
 **	Parameters:
 **		none
 **
 **	Return Value:
 **		none
 **
 **	Errors:
 **		none
 **
 **	Description:
 **		Turn the display off. This does not power the display
 **		down. All it does is send the display off command.
 */

void OledDisplayOff(void)
{
	prtDataCmd = 0;
	DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) oled_ssd1306.d_off, sizeof(oled_ssd1306.d_off), 0, 0);
}

/* ------------------------------------------------------------ */

/***	OledClear
 **
 **	Parameters:
 **		none
 **
 **	Return Value:
 **		none
 **
 **	Errors:
 **		none
 **
 **	Description:
 **		Clear the display. This clears the memory buffer and then
 **		updates the display.
 */

void OledClear(void)
{
	OledClearBuffer();
	OledUpdate();
}

/* ------------------------------------------------------------ */

/***	OledClearBuffer
 **
 **	Parameters:
 **		none
 **
 **	Return Value:
 **		none
 **
 **	Errors:
 **		none
 **
 **	Description:
 **		Clear the display memory buffer.
 */

void OledClearBuffer(void)
{
	int32_t ib;
	uint8_t * pb;

	pb = rgbOledBmp;

	/* Fill the memory buffer with 0.
	 */
	for (ib = 0; ib < cbOledDispMax; ib++) {
		*pb++ = 0x00;
	}

}

/* ------------------------------------------------------------ */

/***	OledUpdate
 **
 **	Parameters:
 **		none
 **
 **	Return Value:
 **		none
 **
 **	Errors:
 **		none
 **
 **	Description:
 **		Update the OLED display with the contents of the memory buffer
 */

void OledUpdate(void)
{
	int32_t ipag;
	uint8_t* pb;
	uint8_t TXbuffer[] = {0x22, 0x00, 0x00, 0x10};

	pb = rgbOledBmp;

	for (ipag = 0; ipag < cpagOledMax; ipag++) {
		prtDataCmd = 0;
		/* Set the page address
		 */
		//Set page command
		//page number
		/* Start at the left column
		 */
		//set low nibble of column
		//set high nibble of column
		TXbuffer[1] = ipag;
		DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) TXbuffer, sizeof(TXbuffer), 0, 0);
		prtDataCmd = 1;
		/* Copy this memory page of display data.
		 */
		OledPutBuffer(ccolOledMax, pb);
		pb += ccolOledMax;
	}
}

/* ------------------------------------------------------------ */

/***	OledPutBuffer
 **
 **	Parameters:
 **		cb		- number of bytes to send
 **		rgbTx	- pointer to the buffer to send
 **
 **	Return Value:
 **		none
 **
 **	Errors:
 **		none
 **
 **	Description:
 **		Send the bytes specified in rgbTx to the slave OLED
 */


void OledPutBuffer(int32_t cb, uint8_t * rgbTx)
{
	DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) rgbTx, cb, 0, 0);
}