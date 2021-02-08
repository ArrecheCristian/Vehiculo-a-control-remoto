### Recepción/Transmisión Inalámbrica

Para implementar el manejo por control remoto se utiliza el protocolo Bluetooth, 
más especificamente el módulo HM-10, que funciona como una comunicación serie
inalámbrica. Del lado del usuario se utiliza la aplicación de Android
"BLEJoystick", disponible en Google Play Store. También se cuenta con un LED
para indicar la correcta vinculacion entre la app y el módulo bluetooth.

#### Componentes a utilizar

| Componente    | Código    | Valor     | Cantidad  | Función                           | Protocolo |
| ------------- | --------- | --------- | --------- | --------------------------------- | --------- |
| Rx/Tx BLE     | HM-10     | -         | 1         | Recepción y transmisión Bluetooth | UART 8N1  |
| LED           | -         | Rojo 3mm  | 1         | Informar estado de la conexión    | Digital   |

#### Rx/Tx BLE

El módulo Bluetooth a utilizar es el HM-10 provisto por la cátedra, el cual ya
fue utilizado en asignaturas anteriores por lo cual se conocen sus características 
y su funcionamiento.
Además, la sAPI de la CIAA provee una librería para comunicación Bluetooth, facilitando 
su programación.

Respecto a las características de Hardware, el HM-10 funciona a 3.3v, por lo que
no hay que realizar ninguna adaptación para su funcionamiento.

#### LED

Para la alimentación del LED se utiliza el puerto GPIO1, realizando los 
siguientes cálculos se obtiene el valor de la resistencia que necesita 
para su conexión:

$$LED_I = 5mA$$

$$LED_V = 1.2V$$

$$V = 3.3V$$
$$ R = \frac{V - LED_V}{LED_I} = \frac{3.3V - 1.2V}{5mA} = 420\Omega $$

#### Conexionado

**HM-10:** El módulo Bluetooth se comunica a través de un protocolo serie 8N1,
a 9600 bps, y se configura a través de comandos AT. Las librerías de la CIAA
ya proveen funciones para establecer una comunicación con un módulo HM-10.

**LED:** Se conecta de manera directa a una salida digital del integrado, 
teniendo en cuenta la resistencia mencionada.

#### Esquemático

TODO

### Controlador de Motores

Para el control de motores se utiliza el circuito integrado L293D, en nuestro 
caso utilizamos la versión de STMicroelectronics, el cual provee dos puente H completos,
permitiendo así controlar hasta dos motores en ambos sentidos.

#### Componentes a utilizar

| Componente    | Código    | Valor     | Cantidad  | Función                           | Protocolo     |
| ------------- | --------- | --------- | --------- | --------------------------------- | ------------- |
| Puente H      | L293D     | -         | 2         | Controlar motores                 | Analógico/PWM |

#### Puente H

Al investigar sobre circuitos que provean puentes H para controlar motores de
continua, rápidamente encontramos el L293D. Este tiene 4 canales, cada uno
formando medio puente H. Dado que para girar motores en ambos sentidos se
requiere un puente completo, se pueden controlar dos motores con un solo
L293D.

En términos de conexionado provee un *enable* por cada par de canales,
alimentación independiente para lógica y motores, y 6 pines centrales para
disipación de calor.

Respecto a la alimentación, requiere entre 4.5v y 30v. Dado el elevado consumo
es imposible alimentarlo directamente a través de la CIAA, por lo que se conecta  
de manera directa a la fuente de alimentación.

Soporta corrientes pico de 1.2A, por lo que es correcto colocar un disipador en
caso de que los motores consuman mucha corriente.

#### Conexionado

**L293D:** Las entradas de los L293D se controlan mediante modulación PWM, permitiendo
controlar la velocidad y el sentido de cada motor de manera independiente. Esto requiere
utilizar 8 PWM, dos para cada motor. Se proporciona una entrada de alimentación separada para la lógica (VCC1), lo que permite la operación
a un voltaje más bajo y se incluyen diodos de protección internos.

#### Esquemático

TODO

### Detector de obstáculos

Para detectar obstáculos se utiliza el sensor de proximidad de Arduino
HC-SR04, que permite captar objetos entre 2cm y 400cm, con un ángulo de 15°. 
Estos rangos resultan ideales para detectar obstáculos y actuar en consecuencia
en un vehículo a control remoto.

#### Componentes a utilizar

| Componente        | Código    | Valor     | Cantidad  | Función                           | Protocolo     |
| ----------------- | --------- | --------- | --------- | --------------------------------- | ------------- |
| Sensor Proximidad | HC-SR04   | -         | 1         | Medir distancia a obstáculos      | Digital       |
| Buzzer            | -         | -         | 1         | Indicar mediante sonido           | Digital       |

#### Sensor de Proximidad

El HC-SR04 es un sensor ultrasónico que permite calcular la distancia de los
objetos que se encuentran en frente a él, con un ángulo de visión de 15°. 
Utiliza una onda sonora de 40kHz, inaudible para el oido humano, que se emite
 cuando se coloca un 1 en el pin *trigger*. Cuando el módulo detecta el rebote 
 del pulso emitido, coloca un 1 en el pin *echo*. Midiendo el tiempo entre la 
 emisión del pulso y la recepción del eco, puede determinarse la distancia al objeto.

#### Buzzer

Se utiliza como componente auxiliar para indicar la presencia de obstáculos mediante sonido.

#### Conexionado

**HC-SR04:** Para medir con presición el tiempo transcurrido entre las señales mencionadas, 
es necesario utilizar un timer en modo *input capture* para captar el flanco en 
la entrada y lograr la mayor presición posible. 
El *trigger* se generará con una salida GPIO común.

**Buzzer:** Dado que el consumo del buzzer supera el máximo tolerado por los puertos GPIO de la CIAA, 
se utiliza un transistor para alimentar el buzzer y asegurar su correcto funcionamiento
sin dañar ningún componente de hardware. Se utiliza el pin de GPIO7 como salida para el LED.


#### Esquemático

TODO

### Indicadores de estado

Se utiliza como componente auxiliar para indicar el estado del vehículo, un
LED que indica si el vehículo está encendido.

#### Componentes

| Componente        | Código    | Valor     | Cantidad  | Función                           | Protocolo     |
| ----------------- | --------- | --------- | --------- | --------------------------------- | ------------- |
| LED               | -         | Rojo 3mm  | 1         | Indicar si la CIAA tiene tensión  | Digital       |


#### Conexionado

Se utiliza el pin de GPIO0 como salida para el LED.

#### Esquemático

TODO

### Cálculos de Corriente

| Subsistema    | Tensión [V]   | Corriente [mA]    |
| ------------- | ------------- | ----------------- |
| Principal     | 3.3           | 100               |
| UART2 (BT)    | -             | 0.5               |
| SCT * 3       | -             | 0.16 *3           |
| GPIO * 6      | -             | 5 * 6             |
| HM-10         | 3.3           | 10                |
| L293D * 2     | 5             | 32 * 2            |
| Motor * 4     | 5             | 100 * 4           | 
| ------------- | ------------- | ----------------- |
| **Total**     | 3.3           | 140               |
| **Total**     | 5             | 500               |

Como se puede observar, dado la variedad de dispositivos y componentes,
se requieren dos valores de tensión diferentes. Además, al tratarse de un vehículo
manejado inalámbricamente, es necesario el uso de baterías. Utilizando baterías de Litio, 
que poseen tensiones de entre 3.7v y 4.2v, es necesario utilizar un conversor DC-DC 
step-down para obtener tensiones de 3.3v, y un conversor step-up para obtener tensiones de 5v.
