//header para la comunicación inalámbrica del vehículo

#ifndef BT_H
#define BT_H

//funcion de inicializacion del modulo HM-10
void bluetooth_init();

//rutina de interrupcion de la UART
void interrupcionRx(void*);

//funcion encargada de leer el estado del control remoto y comunicar las proximas acciones a los motores
void actualizar_bluetooth();

#endif
