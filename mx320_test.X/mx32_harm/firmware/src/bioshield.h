/* 
 * File:   bioshield.h
 * Author: root
 *
 * Created on May 9, 2017, 3:35 PM
 */

#ifndef BIOSHIELD_H
#define	BIOSHIELD_H

#ifdef	__cplusplus
extern "C" {
#endif

#include "app.h"
#include "../mx32_harm.X/OledDriver.h"
#include "../mx32_harm.X/OledChar.h"
#include "../mx32_harm.X/OledGrph.h"
#include <stdio.h>

#define ssw1 PORTDbits.RD8
#define ssw2 PORTDbits.RD9
#define ssw3 PORTDbits.RD10
#define ssw4 PORTDbits.RD11
#define pbsw1 PORTFbits.RF1
#define pbsw2 PORTDbits.RD5
#define pbsw3 PORTDbits.RD6
#define pbsw4 PORTDbits.RD7
#define MOTOR_FET1	PORTDbits.RD0

#define LEDBAR  PORTE
#define LD8     PORTEbits.RE7
#define LD7     PORTEbits.RE6
#define LD5     PORTEbits.RE5


	void BasicIO_Initialize(void);
	void board_test(void);
#ifdef	__cplusplus
}
#endif

#endif	/* BIOSHIELD_H */

