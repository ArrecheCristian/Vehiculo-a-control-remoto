#include "sapi.h"        
#include "motor.h"

// variable enteras de 32 bits para guardar la distancia al obstaculo, en centimetros.
uint32_t distancia = 100;


//inicializacion del sensor de proximidad. Soporte para 3 sensores, se especifica que se usara el numero 0.
void sensor_init(){
	ultrasonicSensorConfig( ULTRASONIC_SENSOR_0, ULTRASONIC_SENSOR_ENABLE );
}



//medicion de la distancia al obstaculo y actuar en consecuencia
void evaluar_colisiones(){

	// obtenemos la distancia actual
	distancia = ultrasonicSensorGetDistance(ULTRASONIC_SENSOR_0, CM);

	//a modo prueba, dependiendo la distancia, activamos un LED rojo 
	if(distancia <= 15){
		gpioWrite(LEDR, ON);
		bloquear();
	}else{
		gpioWrite(LEDR, OFF);
		desbloquear();
	}
}



