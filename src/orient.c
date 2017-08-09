#include "app.h"
#include "orient.h"
#include "bioshield.h"


struct orienter_data_t orienter_motor= {
	.old_orienter_bits=0xff,
};

struct orienter_bits_t * orienter_bits=(void *)&orienter_motor.orienter_bits;

int32_t orienter_motor_check(int param1, int param2)
{
	char headder[16];
	static uint32_t display_delay = 0;

	orienter_motor.orienter_bits=0;
	orienter_motor.orienter_bits = pbsw1 + (pbsw2 << 1) + (pbsw3 << 2) + (pbsw4 << 3);
	LEDBAR = orienter_motor.orienter_bits;

	if ((orienter_motor.orienter_bits != orienter_motor.old_orienter_bits) || (display_delay++ == 500000)) {
		display_delay = 0;
		orienter_motor.old_orienter_bits = orienter_motor.orienter_bits;
		OledClearBuffer();
		OledSetCursor(0, 0);
		sprintf(headder, "A%d B%d", (uint32_t) orienter_bits->orienter_a, (uint32_t) orienter_bits->orienter_b);
		OledPutString(headder);
		OledSetCursor(0, 1);
		OledPutString("E220 orienter");
		OledSetCursor(0, 2);
		OledPutString("Basic test for ");
		OledSetCursor(0, 3);
		OledPutString("encoder");
	}
	return 0;
}
