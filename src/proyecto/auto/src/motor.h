#include "sapi.h"

#ifndef MOTOR_H
#define MOTOR_H


//"CAPA ALTA". Usada por el usuario/programa principal para mayor abstraccion

//enumerativo para el estado del vehículo en general
typedef enum {
    REPOSO,
    IZQUIERDA,
    DERECHA,
    ADELANTE,
    ATRAS,
    FRENADO
} estado_auto_e;

//configura el estado inicial de todos los motores
void motores_init();

//acciona el vehiculo
void desplazar(estado_auto_e);

//actualiza el estado del vehículo
void actualizar_desplazamiento();

//bloquea y desbloquea el movimiento del auto hacia adelante
void bloquear();
void desbloquear();



//"CAPA BAJA". Usada internamente para manejar los motores de manera independiente

//enumerativo para seleccionar cada motor independientemente
typedef enum {
    M_DELANTERO_IZQ,
    M_DELANTERO_DER,
    M_TRASERO_IZQ,
    M_TRASERO_DER
} motor_e;

//enumerativo para indicar el estado de cada motor independientemente
typedef enum {
    M_MOV_ADELANTE,
    M_MOV_ATRAS,
    M_LIBRE,
    M_FRENADO_RAPIDO
} estado_motor_e;


//inicializacion/configuracion de los motores (PWMs, GPIOs, ENABLEs, etc.)
void motores_config();

void set_motor(motor_e, estado_motor_e);


#endif
