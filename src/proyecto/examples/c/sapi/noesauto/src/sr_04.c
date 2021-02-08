#include "sapi.h"        // <= Inclusion de la Biblioteca sAPI
//#include "motor.h"

// Variables enteras de 32 bits para guardar la distancia en centimetros
uint32_t distancia = 100;

void sr_04_init(){
	// Inicializar el sensor ultrasonico HC-SR04
	ultrasonicSensorConfig( ULTRASONIC_SENSOR_0, ULTRASONIC_SENSOR_ENABLE );

	pwmConfig( 0, PWM_ENABLE );
	pwmConfig( PWM7, PWM_ENABLE_OUTPUT );

	delay(100); // Retardo inicial de 100 ms

}

// FUNCION PRINCIPAL, PUNTO DE ENTRADA AL PROGRAMA LUEGO DE ENCENDIDO O RESET.
int evaluar_colisiones( void )
{
	// Obtenemos la distancia actual medida por el sensor en centimetros
	distancia = ultrasonicSensorGetDistance(ULTRASONIC_SENSOR_0, CM);
	printf("SR04 \r\n");

	//Si la distancia es menor a 15 Cms, bloqueo el movimiento
	if(distancia <= 15){
		gpioWrite(LED1, ON);
		//bloquear(ADELANTE);
    	printf("OBSTACULO DETECTADO \r\n");
	}else{
		gpioWrite(LED1, OFF);
		//desbloquear(ADELANTE);
    	printf("LIBRE \r\n");
	}

	return 0;
}



