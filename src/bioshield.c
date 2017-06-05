#include "bioshield.h"

void BasicIO_Initialize(void)
{
	/* 
	 * basic io shield display init
	 */

	OledInit();
	DRV_ADC_Open();
	DRV_ADC_Start();


}

void board_test(void)
{
	static uint32_t i = 0, j = 0, irow = 0, update_speed = 60000;
	int32_t pot1 = 0;
	static uint8_t cylon = 0xff;
	static int32_t alive_led = 0;
	static bool LED_UP = true;
	char headder[16];

	if (i++ > update_speed) {
		i = 0;

		if (DRV_ADC_SamplesAvailable()) {
			//			DRV_ADC_Stop();
			pot1 = DRV_ADC_SamplesRead(0);
			if (pbsw4) {
				update_speed = 10000 + pot1;
			} else {
				update_speed = 60000 + pot1;
			}
		}
		//		DRV_ADC_Start();

		if (j++ >= 1) { // delay a bit ok
			if (0) { // screen status feedback
				LEDBAR = ~cylon; // roll leds cylon style
			} else {
				LEDBAR = cylon; // roll leds cylon style (inverted)
			}

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
			LD5 = LED_UP;
		}
		OledClearBuffer();
		OledSetCursor(0, 0);
		sprintf(headder, "A %d P %d", pot1,DRV_TMR0_PeriodValueGet());
		OledPutString(headder);
		OledSetCursor(0, 1);
		OledPutString("chipKIT Uno32");
		OledSetCursor(0, 2);
		OledPutString("Basic I/O Shield");
		OledSetCursor(0, 3);
		OledPutString("XC32 & Harmony 2");

		OledMoveTo(0, irow & 31);
		OledDrawRect(127, 31);
		OledMoveTo(0, irow & 31);
		OledLineTo(127, irow & 31);
		OledUpdate();
		irow++;
		DRV_OC0_PulseWidthSet(DRV_TMR0_PeriodValueGet()/cylon);
	}
}