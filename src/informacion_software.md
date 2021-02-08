# Arquitectura de Software

## Conexionado

### Módulo bluetooth

| Función   | Pin header    | Etiqueta  |
| --------- | ------------- | --------- |
| Rx        | P123          |           |
| Tx        | P125          |           |
| State     |               | LCDEN     |
### L293D

#### Entradas de direccion

| # Puente  | Entrada   | GPIO      |
| --------- | --------- | --------- |
| 1         | +         | GPIO1     |
| 1         | -         | LCD3      |
| 2         | +         | LCD2      |
| 2         | -         | LCD1      |
| 3         | +         | GPIO0     |
| 3         | -         | LCD4      |
| 4         | +         | LCDRS     |
| 4         | -         | GPIO2     |

#### Entradas Enable

| Puente    | Librería PWM  | Pin timer | Etiqueta CIAA | Pin header    | Timer#    |
| --------- | ------------- | --------- | ------------- | ------------- | --------- |
| 1         | PWM0		    | CTOUT1	| T_FIL1	    | P136 	        | Timer3    |
| 2         | PWM1		    | CTOUT12	| T_COL2	    | P134 	        | Timer3    |
| 3         | PWM2		    | CTOUT10	| T_COL0	    | P139 	        | Timer3    |
| 4         | PWM5		    | CTOUT13	| T_COL1	    | P131 	        | Timer3    |

### Sensor de Proximidad

| Función   | Etiqueta CIAA | Pin header    |
| --------- | ------------- | ------------- |
| Trigger   | GPIO3         | P234          |
| Echo      | T_FIL0        |               | (Conectado a Timer0, CTOUT0)

### Status

| Función   | GPIO#         |
| --------- | ------------- |
| LED Power | GPIO0         |
| LED BT    | GPIO1         |
| STATE BT  | GPIO2         |
| Buzzer    | GPIO7         |

## Arquitectura general

* Super loop
* Interrupciones por hardware para manejar el sistema de evasión de colisiones (opcional)

### Subsistema de motores

#### Capa alta

Capa utilizada por el programa principal para controlar el desplazamiento, debe tener los siguientes enumerativos:

* Para mantener el estado del vehículo: `estado_movimiento_e = {REPOSO IZQUIERDA DERECHA ADELANTE ATRAS FRENADO}`

Y las siguientes funciones:

* Para setear la dirección: `void desplazar(estado_motor_e)`
* Para bloquear el movimiento en una dirección: `void bloquear(estado_motor_e)`
* Para actualizar el movimiento: `void actualizar_deplazamiento()`

#### Capa baja

Capa utilizada por la capa alta, podría ser usado por el usuario pero no es la
idea. Posee los siguientes enumerativos:

* `motor_e = {DELANTERO_IZQ DELANTERO_DER TRASERO_IZQ TRASERO_DER}`
* `estado_motor_e = {MOV_HORARIO MOV_AHORARIO MOTOR_LIBRE FRENADO_RAPIDO}`

Y las siguientes funciones para controlar cada uno individualmente:

* `void set_motor(motor_e, estado_motor_e)`

### Subsistema de Bluetooth
Se utiliza el módulo **HM-10**. La idea en un principio es usarlo mediante interrupciones, si no admite, usaremos la UART con interrupciones. 

#### Software joystick

* Se utiliza una aplicación llamada BLEJoystick
* Envía caracteres con cierta frecuencia al apretar uno de todos los botones disponibles (los caracteres varían dependiendo el boton presionado). Al soltar envía un 0.

#### Software en la CIAA

La idea es la siguiente: partiendo de un estado reposo, leer el buffer -de tamaño 1- Bluetooth cada 250ms, y de acuerdo al caracter recibido toma la siguiente decisión:

| Char recibido | Acción            |
| ------------- | ----------------- |
| `[Aa]`        | Mover adelante    |
| `[Cc]`        | Mover atrás       |
| `[Dd]`        | Girar izquierda   |
| `[Bb]`        | Girar derecha     |
| `0`           | Reposo            |
| `[Ff]`        | Frenado           |

### Subsistema de proximidad

Se utiliza el módulo **HC-SR04**, un sensor de proximidad ultrasónico que funciona de la siguiente manera: se envía un pulso en el pin *trigger*, el módulo generará un pulso en el pin *echo* cuando reciba el rebote del ultrasonido generado.

Dado a la sensibilidad de tiempo del módulo, se usa un input capture para medir con presición el tiempo transcurrido.

Hay que tener un struct compartido que tenga la siguiente información:

```c
typedef enum {
    esperando_echo, medicion_finalizada
} estado_prox_e;

typedef struct {
    float t_trigger;
    float distancia;
    estado_prox_e estado;
} prox_t;

```
