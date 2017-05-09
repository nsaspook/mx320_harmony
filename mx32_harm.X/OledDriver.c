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

//#include <WProgram.h>
#include <p32xxxx.h>
//#include <plib.h>

#include "OledDriver.h"
#include "OledChar.h"
#include "OledGrph.h"

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

/* ------------------------------------------------------------ */
/*				Forward Declarations							*/
/* ------------------------------------------------------------ */

void OledHostInit();
void OledHostTerm();
void OledDevInit();
void OledDevTerm();
void OledDvrInit();

void OledPutBuffer(int cb, uint8_t * rgbTx);
uint8_t Spi2PutByte(uint8_t bVal);

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

void
OledInit()
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

void
OledTerm()
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
 **		This is currently hard coded for the Cerebot 32MX4 and
 **		SPI2. This needs to be generalized.
 */

void
OledHostInit()
{


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

void
OledHostTerm()
{


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

void
OledDvrInit()
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

void
OledDevInit()
{



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

void
OledDevTerm()
{

	/* Send the Display Off command.
	 */


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

void
OledDisplayOn()
{


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

void
OledDisplayOff()
{



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

void
OledClear()
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

void
OledClearBuffer()
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

void
OledUpdate()
{


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
#if defined (_BOARD_UNO_) || defined(_BOARD_UC32_)

void
OledPutBuffer(int cb, uint8_t * rgbTx)
{
	int ib;
	uint8_t bTmp;

	/* Write/Read the data
	 */
	for (ib = 0; ib < cb; ib++) {
		/* Wait for transmitter to be ready
		 */
		while (SPI2STATbits.SPITBE == 0);

		/* Write the next transmit byte.
		 */
		SPI2BUF = *rgbTx++;

		/* Wait for receive byte.
		 */
		while (SPI2STATbits.SPIRBF == 0);
		bTmp = SPI2BUF;

	}

}
#elif defined (_BOARD_MEGA_)

void
OledPutBuffer(int cb, uint8_t * rgbTx)
{
	int ib;
	int bit;
	uint8_t bVal;

	for (ib = 0; ib < cb; ib++) {

		bVal = *rgbTx++;

		for (bit = 0; bit < 8; bit++) {
			/* Check if MSB is 1 or 0 and set MOSI pin accordingly
			 */
			if (bVal & 0x80)
				PORTSetBits(prtMosi, bitMosi);
			else
				PORTClearBits(prtMosi, bitMosi);

			/* Lower the clock line
			 */
			PORTClearBits(prtSck, bitSck);

			/* Shift byte being sent to the left by 1
			 */
			bVal <<= 1;

			/* Raise the clock line
			 */
			PORTSetBits(prtSck, bitSck);
		}
	}
}
#endif

/* ------------------------------------------------------------ */
/***	Spi2PutByte
 **
 **	Parameters:
 **		bVal		- byte value to write
 **
 **	Return Value:
 **		Returns byte read
 **
 **	Errors:
 **		none
 **
 **	Description:
 **		Write/Read a byte on SPI port 2
 */
#if defined (_BOARD_UNO_) || defined(_BOARD_UC32_)

uint8_t
Spi2PutByte(uint8_t bVal)
{
	uint8_t bRx;

	/* Wait for transmitter to be ready
	 */
	while (SPI2STATbits.SPITBE == 0);

	/* Write the next transmit byte.
	 */
	SPI2BUF = bVal;

	/* Wait for receive byte.
	 */
	while (SPI2STATbits.SPIRBF == 0);

	/* Put the received byte in the buffer.
	 */
	bRx = SPI2BUF;

	return bRx;

}
#elif defined (_BOARD_MEGA_)

uint8_t
Spi2PutByte(uint8_t bVal)
{
	int bit;
	uint8_t bRx;

	for (bit = 0; bit < 8; bit++) {
		/* Check if MSB is 1 or 0 and set MOSI pin accordingly
		 */
		if (bVal & 0x80)
			PORTSetBits(prtMosi, bitMosi);
		else
			PORTClearBits(prtMosi, bitMosi);

		/* Lower the clock line
		 */
		PORTClearBits(prtSck, bitSck);

		/* Shift byte being sent to the left by 1
		 */
		bVal <<= 1;

		/* Raise the clock line
		 */
		PORTSetBits(prtSck, bitSck);
	}

	return bRx;
}
#endif

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

