#include "sapi.h"
#include "motor.h"
#include "buzzer.h"

//terminal positivo y negativo de los motores
#define T_POS 1
#define T_NEG 0


//matriz de conexionado de motores
gpioMap_t CONN_MOTOR[4][2];

//array de ENABLEs de motores
gpioMap_t EN_MOTOR[4];

//enumerativo que indica el estado del vehiculo en general
estado_auto_e estado_auto;

// Mantiene un control de estados bloqueados
bool_t avance_bloqueado;

//dos posibles velocidades
int const velocidad_avance = 255;
int const velocidad_giro = 170;

//"CAPA ALTA"

void motores_init() {

    estado_auto = REPOSO;
    avance_bloqueado = FALSE;
    motores_config();
}


//actualiza el proximo movimiento del vehiculo
void desplazar(estado_auto_e e) {
    estado_auto = e;
}


//actualiza el desplazamiento del vehiculo
void actualizar_desplazamiento() {
    
    desactivar_led_frenado();
    switch (estado_auto){
        //si el estado es reposo, dejar todos los motores como free-roll
        case REPOSO:
            set_motor(M_DELANTERO_DER, M_LIBRE, velocidad_avance);
            set_motor(M_DELANTERO_IZQ, M_LIBRE, velocidad_avance);
            set_motor(M_TRASERO_DER, M_LIBRE, velocidad_avance);
            set_motor(M_TRASERO_IZQ, M_LIBRE, velocidad_avance);
            break;

        //si el estado es frenado se "bloquean" los motores    
        case FRENADO:
        	activar_led_frenado();
            set_motor(M_DELANTERO_DER, M_FRENADO_RAPIDO, velocidad_avance);
            set_motor(M_DELANTERO_IZQ, M_FRENADO_RAPIDO, velocidad_avance);
            set_motor(M_TRASERO_DER, M_FRENADO_RAPIDO, velocidad_avance);
            set_motor(M_TRASERO_IZQ, M_FRENADO_RAPIDO, velocidad_avance);
            break;

        //si el estado es adelante, todos los motores giran en un mismo sentido
        case ADELANTE:
        	//El avance puede ser bloqueado por el detector de colisiones. En ese caso, se vuelve a actualizar el estado del vehiculo
        	if (avance_bloqueado){
        		estado_auto = FRENADO;
        	}else{
        		set_motor(M_DELANTERO_DER, M_MOV_ADELANTE, velocidad_avance);
        		set_motor(M_DELANTERO_IZQ, M_MOV_ADELANTE, velocidad_avance);
        		set_motor(M_TRASERO_DER, M_MOV_ADELANTE, velocidad_avance);
        		set_motor(M_TRASERO_IZQ, M_MOV_ADELANTE, velocidad_avance);
        	}
            break;
        
        //si el estado es atras, todos los motores giran en sentido contrario al caso anterior 
        case ATRAS:
            set_motor(M_DELANTERO_DER, M_MOV_ATRAS, velocidad_avance);
            set_motor(M_DELANTERO_IZQ, M_MOV_ATRAS, velocidad_avance);
            set_motor(M_TRASERO_DER, M_MOV_ATRAS, velocidad_avance);
            set_motor(M_TRASERO_IZQ, M_MOV_ATRAS, velocidad_avance);
            sonido_marcha_atras();
            break;

        //si el estado es izquierda, dos motores giran en un sentido y los otros dos en el sentido contrario
        case IZQUIERDA:
            set_motor(M_DELANTERO_IZQ, M_MOV_ATRAS, velocidad_giro);
            set_motor(M_DELANTERO_DER, M_MOV_ADELANTE, velocidad_giro);
            set_motor(M_TRASERO_IZQ, M_MOV_ATRAS, velocidad_giro);
            set_motor(M_TRASERO_DER, M_MOV_ADELANTE, velocidad_giro);
            break;

        //igual que el caso anterior
        case DERECHA:
            set_motor(M_DELANTERO_IZQ, M_MOV_ADELANTE, velocidad_giro);
            set_motor(M_DELANTERO_DER, M_MOV_ATRAS, velocidad_giro);
            set_motor(M_TRASERO_IZQ, M_MOV_ADELANTE, velocidad_giro);
            set_motor(M_TRASERO_DER, M_MOV_ATRAS, velocidad_giro);
            break;
    }
}


bool auto_quieto(){
	if (estado_auto == REPOSO || estado_auto == FRENADO) return TRUE;

	return FALSE;
}

bool auto_avanzando(){
	if (estado_auto == ADELANTE) return TRUE;

	return FALSE;
}


//bloquea el avance del vehiculo
void bloquear() {
    avance_bloqueado = TRUE;
}


//desbloquea el avance del vehiculo
void desbloquear() {
    avance_bloqueado = FALSE;
}


//"CAPA BAJA"

void motores_config() {
    //H1: trasero izquierda
	//H2: delantero izquierda
	//H3: delantero derecha
	//H4: trasero derecha

	//conexionado de los motores (seteo de la matriz de conexion)
	CONN_MOTOR[M_TRASERO_IZQ][1] = LCD3;
    CONN_MOTOR[M_TRASERO_IZQ][0] = GPIO1;
    CONN_MOTOR[M_TRASERO_DER][1] = LCDRS;
    CONN_MOTOR[M_TRASERO_DER][0] = GPIO2;
    CONN_MOTOR[M_DELANTERO_IZQ][1] = LCD1;
    CONN_MOTOR[M_DELANTERO_IZQ][0] = LCD2;
    CONN_MOTOR[M_DELANTERO_DER][1] = GPIO0;
    CONN_MOTOR[M_DELANTERO_DER][0] = LCD4;

    //enable de los motores (seteo del array de enables)
    EN_MOTOR[M_TRASERO_IZQ] = PWM0;
    EN_MOTOR[M_TRASERO_DER] = PWM5;
    EN_MOTOR[M_DELANTERO_IZQ] = PWM1;
    EN_MOTOR[M_DELANTERO_DER] = PWM2;

	//habilita y configura todas las salidas de PWMs
    pwmConfig(0, PWM_ENABLE);
    pwmConfig(PWM0, PWM_ENABLE_OUTPUT);     //CTOUT1, T_FIL1
    pwmConfig(PWM1, PWM_ENABLE_OUTPUT);     //CTOUT12, T_COL2
    pwmConfig(PWM2, PWM_ENABLE_OUTPUT);     //CTOUT10, T_COL0
    pwmConfig(PWM5, PWM_ENABLE_OUTPUT);     //CTOUT13, T_COL1

    //onfiguracion de todas las salidas de GPIOs para avanzar o retroceder
    gpioConfig(GPIO0, GPIO_OUTPUT);
    gpioConfig(GPIO1, GPIO_OUTPUT);
    gpioConfig(GPIO2, GPIO_OUTPUT);
    gpioConfig(LCD1, GPIO_OUTPUT);
    gpioConfig(LCD2, GPIO_OUTPUT);
    gpioConfig(LCD3, GPIO_OUTPUT);
    gpioConfig(LCD4, GPIO_OUTPUT);
    gpioConfig(LCDRS, GPIO_OUTPUT);
}


//setea los sentido de giro de los motores segun el movimiento a realizar
void set_motor(motor_e m, estado_motor_e e, int velocidad){
    
    switch(e){
        
        case M_MOV_ADELANTE:
            gpioWrite( CONN_MOTOR[m][T_POS], ON );
            gpioWrite( CONN_MOTOR[m][T_NEG], OFF );
            pwmWrite(EN_MOTOR[m], velocidad);
            break;
        
        case M_MOV_ATRAS:
            gpioWrite( CONN_MOTOR[m][T_POS], OFF );
            gpioWrite( CONN_MOTOR[m][T_NEG], ON );
            pwmWrite(EN_MOTOR[m], velocidad);
            break;

        case M_LIBRE:
            //se configuran en cero ambos terminales al igual que el enable
            gpioWrite( CONN_MOTOR[m][T_POS], OFF );
            gpioWrite( CONN_MOTOR[m][T_NEG], OFF );
            pwmWrite(EN_MOTOR[m], 0);
            break;

        case M_FRENADO_RAPIDO:
            //terminales en cero pero el enable se setea con velocidad
            gpioWrite( CONN_MOTOR[m][T_POS], OFF );
            gpioWrite( CONN_MOTOR[m][T_NEG], OFF );
            pwmWrite(EN_MOTOR[m], velocidad);
            break;
    }
}



