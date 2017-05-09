/************************************************************************/
/*																		*/
/*	OledDriver.c	-- Graphics Driver Library for OLED Display			*/
/*																		*/
/************************************************************************/
/*	Author: 	Gene Apperson											*/
/*	Copyright 2011, Digilent Inc.										*/
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
/*  Module Description: 												*/
/*																		*/
/*	This is part of the device driver software for the OLED bit mapped	*/
/*	display on the Digilent Basic I/O Shield. This module contains the	*/
/*	initialization functions and basic display control functions.		*/
/*																		*/
/************************************************************************/
/*  Revision History:													*/
/*																		*/
/*	04/29/2011(GeneA): Created											*/
/*	08/03/2011(GeneA): added functions to shut down the display and to	*/
/*		turn the display on and off.									*/
/*	01/04/2012(GeneA): Changed use of DelayMs to using standard delay	*/
/*		function. Removed delay.h										*/
/*																		*/
/************************************************************************/


/* ------------------------------------------------------------ */
/*				Include File Definitions						*/
/* ------------------------------------------------------------ */

#include <p32xxxx.h>

#include "OledDriver.h"
#include "OledChar.h"
#include "OledGrph.h"
#include "app.h"

/* ------------------------------------------------------------ */
/*				Local Symbol Definitions						*/
/* ------------------------------------------------------------ */

#define	cmdOledDisplayOn	0xAF
#define	cmdOledDisplayOff	0xAE
#define	cmdOledSegRemap		0xA1	//map column 127 to SEG0
#define	cmdOledComDir		0xC8	//scan from COM[N-1] to COM0
#define	cmdOledComConfig	0xDA	//set COM hardware configuration

/* ------------------------------------------------------------ */
/*				Global Variables								*/
/* ------------------------------------------------------------ */

extern uint8_t rgbOledFont0[];
extern uint8_t rgbOledFontUser[];
extern uint8_t rgbFillPat[];

extern int xchOledMax;
extern int ychOledMax;

/* Coordinates of current pixel location on the display. The origin
 ** is at the upper left of the display. X increases to the right
 ** and y increases going down.
 */
int xcoOledCur;
int ycoOledCur;

uint8_t * pbOledCur; //address of byte corresponding to current location
int bnOledCur; //bit number of bit corresponding to current location
uint8_t clrOledCur; //drawing color to use
uint8_t * pbOledPatCur; //current fill pattern
int fOledCharUpdate;

int dxcoOledFontCur;
int dycoOledFontCur;

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
DRV_HANDLE SPIHandle;
DRV_SPI_BUFFER_HANDLE Write_Buffer_Handle;
uint8_t TXbuffer[16];

/* ------------------------------------------------------------ */
/*				Forward Declarations							*/
/* ------------------------------------------------------------ */

void OledHostInit();
void OledHostTerm();
void OledDevInit();
void OledDevTerm();
void OledDvrInit();

void OledPutBuffer(int cb, uint8_t * rgbTx);

#define READ_CORE_TIMER()                 _CP0_GET_COUNT()          // Read the MIPS Core Timer

void BSP_DelayUs(uint16_t microseconds)
{
	uint32_t time;

	time = READ_CORE_TIMER(); // Read Core Timer    
	time += (SYS_CLK_FREQ / 2 / 1000000) * microseconds; // calc the Stop Time    
	while ((int32_t) (time - READ_CORE_TIMER()) > 0) {
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
	prtVddCtrl = 1;
	prtVbatCtrl = 1;
	prtDataCmd = 0;
	prtReset = 1;

	/* config display hardware */
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
	int ib;

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

	/* Default the character routines to automaticall
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
	TXbuffer[0] = 0xAE;
	Write_Buffer_Handle = DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) & TXbuffer[0], 1, 0, 0);
	prtReset = 0;
	DelayMs(1);
	prtReset = 1;
	TXbuffer[0] = 0x8D;
	TXbuffer[1] = 0x14;
	TXbuffer[2] = 0xD9;
	TXbuffer[3] = 0xF1;
	Write_Buffer_Handle = DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) & TXbuffer[0], 4, 0, 0);
	prtVbatCtrl = 0;
	DelayMs(100); // 100 ms
	TXbuffer[0] = 0xA1;
	TXbuffer[1] = 0xC8;
	TXbuffer[2] = 0xDA;
	TXbuffer[3] = 0x20;
	TXbuffer[4] = 0xAF;
	Write_Buffer_Handle = DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) & TXbuffer[0], 5, 0, 0);

	OledUpdate();
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

	TXbuffer[0] = cmdOledDisplayOff;
	Write_Buffer_Handle = DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) & TXbuffer[0], 1, 0, 0);

	/* Turn off VCC
	 */
	prtVbatCtrl = 1;
	DelayMs(100);

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
	TXbuffer[0] = cmdOledDisplayOn;
	Write_Buffer_Handle = DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) & TXbuffer[0], 1, 0, 0);
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
	TXbuffer[0] = cmdOledDisplayOff;
	Write_Buffer_Handle = DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) & TXbuffer[0], 1, 0, 0);
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
	int ib;
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
	int ipag;
	int icol;
	uint8_t* pb;

	pb = rgbOledBmp;

	for (ipag = 0; ipag < cpagOledMax; ipag++) {
		prtDataCmd = 0;
		/* Set the page address
		 */
		//Set page command
		//page number
		/* Start at the left column
		 */
		//set low nybble of column
		//set high nybble of column
		TXbuffer[0] = 0x22;
		TXbuffer[1] = ipag;
		TXbuffer[2] = 0x00;
		TXbuffer[3] = 0x10;
		Write_Buffer_Handle = DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) & TXbuffer[0], 4, 0, 0);
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
 **		cb		- number of bytes to send/receive
 **		rgbTx	- pointer to the buffer to send
 **
 **	Return Value:
 **		none
 **
 **	Errors:
 **		none
 **
 **	Description:
 **		Send the bytes specified in rgbTx to the slave and return
 **		the bytes read from the slave in rgbRx
 */


void OledPutBuffer(int cb, uint8_t * rgbTx)
{
	Write_Buffer_Handle = DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) rgbTx, cb, 0, 0);
}

/* ------------------------------------------------------------ */
/***	ProcName
 **
 **	Parameters:
 **
 **	Return Value:
 **
 **	Errors:
 **
 **	Description:
 **
 */

/* ------------------------------------------------------------ */

/************************************************************************/

