#include "app.h"
#include "orient.h"
#include "bioshield.h"


struct orienter_data_t orienter_motor = {
	.old_orienter_bits = 0xff,
};

struct orienter_bits_t * orienter_bits = (void *) &orienter_motor.orienter_bits;
struct orienter_bits_t * old_orienter_bits = (void *) &orienter_motor.old_orienter_bits;

/*
 Check if motor is moving and encoder lines are changing state
 */
int32_t orienter_motor_check(int param1, int param2)
{
	char headder[16];
	static uint32_t display_delay = 0;

	/* load the variable with the data from the switch inputs */
	if (ssw4) {
		MOTOR_FET1 = 1;
		LED1 = 1;
	} else {
		MOTOR_FET1 = 0;
		LED1 = 0;
	}
	orienter_motor.orienter_bits = 0;
	/* shift the switch bits into the correct spot in the variable */
	orienter_motor.orienter_bits = pbsw1 + (pbsw2 << 1) + (pbsw3 << 2) + (pbsw4 << 3);
	orienter_motor.motor_checks++;
	LEDBAR = orienter_motor.orienter_bits;

	if ((orienter_motor.orienter_bits != orienter_motor.old_orienter_bits) || (display_delay++ == param1)) {
		orienter_motor.motor_run++; // total AB encoder changes
		if (param2 == 1) { // Orient motor at 12vdc
			if (orienter_bits->orienter_a != old_orienter_bits->orienter_a) {
				orienter_motor.a_counts++;
				if (orienter_motor.a_counts > ABCOUNT) {
					orienter_motor.aok1 = 1;
					lp_filter(0.0, 0, -1);
				}
				orienter_motor.motor_checks = 0;

				/* input A B logic, cpu signals are inverted at the opto stage */
				if (old_orienter_bits->orienter_a == 0 && old_orienter_bits->orienter_b == 0) {
					orienter_motor.motor_run_ccw = true;
					orienter_motor.motor_run_cw = false;
					if (orienter_motor.b_counts > ABCOUNT) orienter_motor.aok3 = 1;
				}
				if (old_orienter_bits->orienter_a == 0 && old_orienter_bits->orienter_b == 1) {
					orienter_motor.motor_run_ccw = false;
					orienter_motor.motor_run_cw = true;
					if (orienter_motor.b_counts > ABCOUNT) orienter_motor.aok3 = 1;
				}
			}
			if (orienter_bits->orienter_b != old_orienter_bits->orienter_b) {
				orienter_motor.b_counts++;
				if (orienter_motor.b_counts > ABCOUNT) {
					orienter_motor.aok2 = 1;
					lp_filter(0.0, 0, -1);
				}
				orienter_motor.motor_checks = 0;
			}
		}

		orienter_motor.old_orienter_bits = orienter_motor.orienter_bits;
		if (display_delay >= param1) {
			display_delay = 0;
			OledClearBuffer();
			OledSetCursor(0, 0);
			sprintf(headder, "A%d B%d T%d %s", orienter_motor.a_counts, orienter_motor.b_counts, orienter_motor.motor_run - 1, SVERSION);
			OledPutString(headder);
			OledSetCursor(0, 1);
			sprintf(headder, "CW%d CCW%d C%d", (uint32_t) orienter_motor.motor_run_cw, (uint32_t) orienter_motor.motor_run_ccw,
				(uint32_t) lp_filter((float) orienter_motor.motor_checks, 0, true));
			OledPutString(headder);
			OledSetCursor(0, 2);
			sprintf(headder, "%s %s %s %s", orienter_motor.aok1 == 1 ? "OK" : "NG", orienter_motor.aok2 == 1 ? "OK" : "NG",
				orienter_motor.aok3 == 1 ? "OK" : "NG", orienter_bits->orienter_cw == 1 ? "OK" : "NG");
			OledPutString(headder);
			OledSetCursor(0, 3);
			OledPutString("Orienter Motor");
			orienter_motor.a_counts = 0;
			orienter_motor.b_counts = 0;
			orienter_motor.motor_run = 0;
			orienter_motor.motor_checks = 0;
			orienter_motor.motor_run_ccw = false;
			orienter_motor.motor_run_cw = false;
			orienter_bits->orienter_cw = false;
			orienter_bits->orienter_ccw = false;
			orienter_motor.aok1 = 0;
			orienter_motor.aok2 = 0;
			orienter_motor.aok3 = 0;
		}
	}
	return 0;
}

float lp_filter(float new, uint32_t bn, int32_t slow) // low pass filter, slow rate of change for new, LPCHANC channels, slow/fast select (1) to zero channel
{
	static float smooth[LPCHANC];
	float lp_speed = 0.0, lp_x = 0.0;

	if (bn > LPCHANC)
		return new;
	if (slow) {
		lp_speed = 0.06;
	} else {
		lp_speed = 0.250;
	}
	lp_x = ((smooth[bn]*100.0) + (((new * 100.0)-(smooth[bn]*100.0)) * lp_speed)) / 100.0;
	smooth[bn] = lp_x;
	if (slow == (-1)) { // reset and return zero
		lp_x = 0.0;
		smooth[bn] = 0.0;
	}
	return lp_x;
}
