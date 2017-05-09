/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    app.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It 
    implements the logic of the application's state machine and it may call 
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
// DOM-IGNORE-END


// *****************************************************************************
// *****************************************************************************
// Section: Included Files 
// *****************************************************************************
// *****************************************************************************

#include "app.h"
#ifdef __XC32
#include <xc.h> 
#endif
#include <stdint.h>
#include <stdbool.h>
#include <p32xxxx.h>

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.
    
    Application strings and buffers are be defined outside this structure.
 */

APP_DATA appData;

DRV_HANDLE SPIHandle;
DRV_SPI_BUFFER_HANDLE Write_Buffer_Handle;
DRV_SPI_BUFFER_HANDLE Read_Buffer_Handle;
uint8_t TXbuffer[16];
uint8_t RXbuffer[16];

#define cbOledDispMax 512
//max number of bytes in display buffer
#define ccolOledMax 128
//number of display columns
#define crowOledMax 32
//number of display rows
#define cpagOledMax 4
//number of display memory pages

uint8_t rgbOledBmp[cbOledDispMax] = {
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
};


// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
 */

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


/* TODO:  Add any necessary local functions.
 */


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Remarks:
    See prototype in app.h.
 */

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

void OledPutBuffer(int cb, uint8_t * rgbTx)
{
	Write_Buffer_Handle = DRV_SPI_BufferAddWrite(SPIHandle, (uint8_t *) rgbTx, cb, 0, 0);
}

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

void APP_Initialize(void)
{
	/* Place the App state machine in its initial state. */
	appData.state = APP_STATE_INIT;


	/* TODO: Initialize your application's state machine and other
	 * parameters.
	 * 
	 * basic io shield display init
	 */
	prtVddCtrl = 1;
	prtVbatCtrl = 1;
	prtDataCmd = 0;
	prtReset = 1;

	/* config display hardware */
	prtDataCmd = 0;
	prtVddCtrl = 0;
	DelayMs(1);
	SPIHandle = DRV_SPI_Open(DRV_SPI_INDEX_0, DRV_IO_INTENT_WRITE);
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

/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks(void)
{
	static uint32_t i = 0, j = 0;
	static uint8_t cylon = 0xff;
	static int32_t alive_led = 0;
	static bool LED_UP = true;

	/* Check the application's current state. */
	switch (appData.state) {
		/* Application's initial state. */
	case APP_STATE_INIT:
	{
		bool appInitialized = true;


		if (appInitialized) {

			appData.state = APP_STATE_SERVICE_TASKS;
		}
		break;
	}

	case APP_STATE_SERVICE_TASKS:
	{
		if (i++ > 10000) {
			i = 0;

			if (j++ >= 1) { // delay a bit ok
				if (0) { // screen status feedback
					PORTE = ~cylon; // roll leds cylon style
				} else {
					PORTE = cylon; // roll leds cylon style (inverted)
				}
				for (i = 0; i < cbOledDispMax; i++) {
					rgbOledBmp[i] = cylon;
				}
				i = 0;

				if (LED_UP && (alive_led != 0)) {
					alive_led = alive_led << 1;
					cylon = cylon << 1;
				} else {
					if (alive_led != 0) alive_led = alive_led >> 1;
					cylon = cylon >> 1;
				}
				if (alive_led < 2) {
					alive_led = 2;
					LED_UP = true;
				} else {
					if (alive_led > 128) {
						alive_led = 128;
						LED_UP = false;
					}
				}
				j = 0;
			}
			OledUpdate();
		}
		break;
	}

		/* TODO: implement your application state machine.*/


		/* The default state should never be executed. */
	default:
	{
		/* TODO: Handle error in application's state machine. */
		break;
	}
	}
}



/*******************************************************************************
 End of File
 */
