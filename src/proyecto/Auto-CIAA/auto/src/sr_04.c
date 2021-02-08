#include "sapi.h"        
#include "motor.h"
#include "buzzer.h"

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

	//antes de frenar por un obstaculo, se activa el buzzer para indicar la presencia del mismo
	if(distancia <= 100 && auto_avanzando()){
		sonido_colision();
	}else{
		desactivar_buzzer();
	}

	//Activamos el led de estado cuando detectamos una colisión
	if(distancia <= 30){
		activar_led_colision();
		bloquear();
	}else{
		desactivar_led_colision();
		desbloquear();
	}



}



