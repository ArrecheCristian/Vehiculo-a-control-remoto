#include "sapi.h"


void leds_init(){
	gpioConfig(GPIO8, GPIO_OUTPUT);
	gpioConfig(GPIO7, GPIO_OUTPUT);
	gpioWrite(GPIO8, OFF);
	gpioWrite(GPIO7, OFF);
}


void activar_led_frenado(){
	gpioWrite(GPIO8, ON);
}

void desactivar_led_frenado(){
	gpioWrite(GPIO8, OFF);
}

void activar_led_colision(){
	gpioWrite(GPIO7, ON);
}

void desactivar_led_colision(){
	gpioWrite(GPIO7, OFF);
}


