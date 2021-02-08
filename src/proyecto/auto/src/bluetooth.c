#include "sapi.h"
#include "motor.h"
#include "bluetooth.h"

#define UART_PC        UART_USB
#define UART_BLUETOOTH UART_232

char comando;
char flag_recepcion = 0;


void bluetooth_init(){
    
    //inicializar la UART para utilizarla en el modulo bluetooth, junto con las interrupciones de recepcion de datos
    uartConfig(UART_BLUETOOTH, 9600);
    //setea un callback al evento de recepcion y habilita su interrupcion
    uartCallbackSet(UART_BLUETOOTH, UART_RECEIVE, interrupcionRx, NULL);
    //habilita todas las interrupciones de UART para bluetooth
    uartInterrupt(UART_BLUETOOTH, TRUE);
}


void interrupcionRx( void *noUsado ){
    
    //se lee el caracter/comando recibido y se activa el flag de interrupcion 
    comando = uartRxRead( UART_BLUETOOTH );
    flag_recepcion = 1;
}


//en caso de recibir un comando, se comunica el siguiente estado a los motores
void actualizar_bluetooth(){

    if(flag_recepcion){
        flag_recepcion = 0;

        switch (comando){
            case 'A':
            case 'a':
            	desplazar(ADELANTE);
                break;
            case 'B':
            case 'b':
            	desplazar(DERECHA);
            	break;
            case 'C':
            case 'c':
            	desplazar(ATRAS);
                break;
            case 'D':
            case 'd':
            	desplazar(IZQUIERDA);
                break;
            case 'H':
            case 'h':
            	desplazar(FRENADO);
                break;
            case '\0':
            	desplazar(REPOSO);
                break;
            default:
            	gpioWrite(LED1, ON); 
                break;
        }
    }   
}
