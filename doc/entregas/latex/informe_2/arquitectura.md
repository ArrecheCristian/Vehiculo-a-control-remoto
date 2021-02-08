# Arquitectura de Software

Se optó por utilizar una arquitectura Time-Triggered cooperativa, donde las
tareas se corresponden con los subsistemas de Hardware:

* Control de motores
* Recepción inalámbrica
* Detector de obstáculos

Además de la interrupción de tiempo, propia de la arquitectura Time Triggered,
se necesita una interrupción de tiempo independiente utilizada por el sensor de proximidad 
para medir con  presición la distancia a la que se encuentran los obstáctulos.

El psuedocódigo del programa principal se resume a lo siguiente:

```
interrupcion 50ms:
    flag_tiempo = 1

variables compartidas:
    accion_vehiculo # Enumerativo que indica el desplazamiento que se debe realizar


programa principal:
    inicializacion motores
    inicializacion bluetooth
    inicializacion detector de colisiones
    prender led power

    super loop:
        si flag_tiempo = 1:
            leer bluetooth
            detectar colisiones
            actualizar motores
            flag_tiempo = 0
```

TODO justificar los 50ms

### Pseudocodigo de los módulos

#### Leer Bluetooth

```
si hay mensajes nuevos:
    leer el mensaje
    si es una A o a:
        motor = avance
    si es una C o C:
        motor = retrocede
    si es una D o d:
        motor = giro izquierda
    si es una B o b:
        motor = giro derecha
    si es un 0:
        motor = giro libre
    si es una F o f:
        motor = freno
```

#### Detectar colisiones

El eco producido por el módulo se genera -aproximadamente- entre 60uS y 12mS. 
Creemos que no es necesario realizar las mediciones cada estos periodos tan cortos de tiempo,
dado que, puede ser contraproducente para los tiempos del sistema considerando 
el objetivo del sensor. Por esto, el procesamiento del  se realiza cada 250ms:

```
inicializar detector de colisiones:
    tick_colision = 0

detectar colisiones:
    tick_colision++
    si tick_colision = 5:
        tick_colision = 0
        tomar tiempo
        prender input capture
        enviar señal de comienzo de medicion

    si llego el echo:
        calcular distancia
        si hay un obstaculo cerca:
            bloquear movimiento hacia adelante
```

#### Actualizar motores

Los motores se controlan en dos niveles: a bajo nivel se puede controlar cada
motor de manera independiente, indicando la dirección de giro. Una capa más "alta"
permite controlar el vehículo más facilmente, brindando funciones para indicar
como se debe mover el vehículo.

TODO gráfico motores


Por lo que el pseudocodigo se reduce a lo siguiente

```
inicializacion de motores:
    setear movimiento en libre

actualizacion de motores:
    ver accion_vehiculo
    mover el vehiculo en la direccion solicitada

    # A modo de ejemplo se explica como mover en una sola direccion
    si movimiento es hacia adelante:
        motor trasero izquierdo girar horario
        motor trasero derecho girar antihorario
        motor delantero izquierdo girar horario
        motor delantero derecho girar horario
    ...
```

A bajo nivel se controla cada motor individualmente:

```
si movimiento es horario:
    colocar canal 1 en alto
    colocar canal 0 en bajo
si movimiento es anti horario:
    colocar canal 0 en bajo
    colocar canal 1 en alto
```

### Software Android

#### BLEJoystick
BLEJoystick es la aplicación a utilizar para el control inalámbrico del vehículo, 
está disponible para múltiples dispositivos android y se puede descargar de manera 
gratuita desde Google Play Store. Esta aplicación se conecta al módulo bluetooth HM-10 
mediante el protocolo bluetooth low energy 4.0 (BLE).
Cuenta con 8 botones, donde el funcionamiento de cada uno es el siguiente:
* Cuando se presiona por primera vez, envía una letra en mayúscula.
* Mientras siga presionado el mismo botoón, envía la misma letra en minúscula de manera constante. 
* Cando se suelta el boton, envía un 0.

A continuación se describe cada uno de los botones y su letra correspondiente:
| Botón     | Letra inicial | Letra constante   |
| --------- | ------------- | ----------------- |
| Arriba    |   A           |   a               |
| Derecha   |   B           |   b               |
| Abajo     |   C           |   c               |
| Izquierda |   D           |   d               |
| Triángulo |   E           |   e               |
| Círculo   |   F           |   f               |
| Equis     |   G           |   g               |
| Cuadrado  |   H           |   h               |

