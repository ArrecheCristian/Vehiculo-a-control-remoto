#include "sapi.h"
#include "motor.h"

int tipo_de_sonido=0; //0=No hay sonido, 1=Colision detectada, 2=Marcha atras
int contador=0;
int estado_buzzer=0;

void buzzer_init(){
	gpioConfig(GPIO6, GPIO_OUTPUT);
	gpioWrite(GPIO6, OFF);
}

void desactivar_buzzer(){
	tipo_de_sonido=0;
}

void sonido_colision(){
	tipo_de_sonido=1;
}

void sonido_marcha_atras(){
	tipo_de_sonido=2;
}

void actualizar_buzzer(){
	if(tipo_de_sonido==1){
		contador++;
		if(contador==2){
			estado_buzzer=!estado_buzzer;
			gpioWrite(GPIO6, estado_buzzer);
			contador=0;
		}
	}

	if(tipo_de_sonido==2){
		contador++;
		if(contador==5){
			estado_buzzer=!estado_buzzer;
			gpioWrite(GPIO6, estado_buzzer);
			contador=0;
		}
	}

	if(auto_quieto() || tipo_de_sonido==0){
		gpioWrite(GPIO6, OFF);
		contador=0;
		tipo_de_sonido=0;
	}

}
