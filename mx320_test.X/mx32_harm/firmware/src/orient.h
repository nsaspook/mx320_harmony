/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _ORIENT_H    /* Guard against multiple inclusion */
#define _ORIENT_H


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

/* This section lists the other files that are included in this file.
 */

/* TODO:  Include other files here if needed. */


/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

#define SVERSION	"V0.7"
#define LPCHANC	8
#define ABCOUNT	200
#define MOTORCYCLES	500000

#define LED1    LATBbits.LATB1
#define LED2    LATBbits.LATB2
#define LED3    LATBbits.LATB3

	typedef struct orienter_data_t {
		uint32_t a_counts, b_counts;
		uint32_t motor_run_cw : 1;
		uint32_t motor_run_ccw : 1;
		uint32_t aok1 : 1;
		uint32_t aok2 : 1;
		uint32_t aok3 : 1;
		uint32_t motor_run;
		uint32_t motor_checks;
		uint8_t orienter_bits, old_orienter_bits;
	} orienter_data_t;

	typedef struct orienter_bits_t {
		uint8_t orienter_a : 1;
		uint8_t orienter_b : 1;
		uint8_t orienter_power : 1;
		uint8_t orienter_aux : 1;
		uint8_t dummy : 3;
		uint8_t ab_poll : 1;
	} orienter_bits_t;

	int32_t orienter_motor_check(int, int);
	float lp_filter(float, uint32_t, int32_t);
	/* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */
