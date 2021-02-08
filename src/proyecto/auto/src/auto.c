#include "sapi.h"
#include "bluetooth.h"
#include "sr_04.h"
#include "motor.h"


bool_t flag_tiempo;


//rutina de interrupcion de tiempo para el loop principal
void int_tiempo(){
	flag_tiempo = TRUE;
}



int main(void) {

	boardConfig(); 						// inicializar y configurar la plataforma
	uartConfig( UART_USB, 9600 );		// inicializar periferico UART_USB


	//inicializaciones de modulos

	bluetooth_init();
	sensor_init();
	motores_init();

	//configuracion de interrupcion de tiempo SysTick. Producida cada 50ms.
	tickConfig(50); 
    tickCallbackSet(int_tiempo, (void*) 0);

    delay(100);

    while(TRUE){

    	if(flag_tiempo){
    		flag_tiempo = FALSE;

    		actualizar_bluetooth();
    		evaluar_colisiones();
    		actualizar_desplazamiento();
    	}
    }


	// no debe llegar nunca a este punto, debido a que a este programa se ejecuta
	// directamente sobre un microcontrolador y no es llamado por ningun
	// Sistema Operativo, como en el caso de un programa para PC.
	return 0;
}
