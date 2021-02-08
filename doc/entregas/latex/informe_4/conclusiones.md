# Conclusiones

## Cumplimiento de los objetivos

El objetivo principal del proyecto era crear un vehículo a escala que pueda ser
controlado de manera remota por el usuario, se pudo comprobar la viabilidad
tanto en términos de hardware como de software de los objetivos planteados desde
un principio. Permitiendo, de esta manera, el desarrollo total del proyecto en
tiempo y forma.  

A su vez, se dividió el proyecto en 4 partes principales:

1. Estructura física del vehículo

La estructura del vehículo fue realizada con la carcaza de una lectora de CD. La
misma fue modificada para poder colocar los 4 motores, la EDU-CIAA junto con el
poncho y las pilas de litio.

Para una mejor apariencia física, se optó por remover la tapa superior de la
carcaza. De esta manera, quedan a simple vista todos los componentes que
conforman el vehículo.

La estructura demostró ser lo suficientemente rígida y ligera para soportar
todos los componentes de hardware, y a su vez, permiter que los motores puedan 
transportarla sin la necesidad de una potencia excesiva. 

2. Control de motores

El control de los motores del vehículo se realizó a través del integrado L293D,
el cual cuenta con dos puente H completos. Estos están ubicados sobre el poncho,
distribuidos de manera que el conexionado permita que con un integrado se
controle el motor delantero y trasero de un lateral del vehículo.

Cada motor permite el movimiento en ambos sentidos de giro, de manera que el
vehículo cumple con los objetivos de avanzar, rotar y retroceder. 

3. Control remoto

El usuario puede controlar el vehículo de manera remota utilizando el módulo
HM-10, el cual funciona mediante el protocolo bluetooth.

Se optó por utilizar una aplicación de android ya implementada "BLEJoystick",
disponible en Google Play Store, siendo esta muy simple y sencilla de utilizar.
De esta manera, se cumplió con el objetivo de poder manejar el vehículo desde
una distancia de hasta aproximadamente 20 metros. 

4. Medición de sensores y respuesta en consecuencia

Con el fin de detectar objetos/obstáculos delante del vehículo, se cuenta con un
sensor de proximidad ultrasónico HC-SR04, ubicado en el frente del poncho.

Luego de realizar algunas pruebas, se observó que la distancia para
bloquear el avance del vehículo debía ser configurada con algunos centímetros
extras de margen, debido al tiempo de respuesta del sensor. De esta manera, se
fijó una distancia máxima de 30cm, con un ángulo de visión de 15°,
cumpliendo con el objetivo de bloquear el avance del vehículo justo antes de
impactar con cualquier objeto.  

A su vez, se agregó un buzzer con el objetivo de indicar el evento de colisión
mediante sonido, generando una alerta cada vez que se detecta un obstáculo antes
de realizar el bloqueo total del vehículo. 

No ha sido implementado el objetivo secundario del sensor de luminosidad LDR,
debido a la demanda de tiempo de dicha tarea y a la complejidad del diseño del
poncho. 


## Cumplimiento de Requerimientos

### Requerimientos Funcionales

#### Requerimientos de Software

##### Control de Motores

1. El sistema debe accionar 4 motores individualmente, permitiendo girar en
   ambas direcciones.
   
   Se cumplió con el objetivo parcialmente. Dado que el pin *enable* de los
   L293D es compartido por todos los motores, por lo que se obtienen las
   siguientes características: 

   * Todas las ruedas se accionan en simultaneo, es decir, giran todas o no
     gira ninguna.   
   * La velocidad de todas las ruedas puede controlarse de igual manera.
   * Individualmente puede controlarse: dirección de giro y frenado rápido.

2. El sistema debe accionar motores en conjunto, permitiendo avanzar, retroceder
   y girar.
   
   Se cumplió completamente con el objetivo, ya que se puede:

  * Avanzar si toda las ruedas giran hacia adelante.
  * Retroceder si todas las ruedas giran hacia atrás
  * Girar para ambos lados, si un par lateral trata de avanzar y el otro par
    retroceder. Como podemos ver a continuación:

![Dirección de giro](informe_4/diagrama_giro.png)

3. El sistema debe permitir el bloqueo de movimiento en una dirección (por
   ejemplo debido a un obstáulo detectado por el sensor de proximidad).
   
   Se cumplió parcialmente con el objetivo, ya que se puede bloquear solo el
   movimiento hacia adelante. Esto puede verse en el código:

   ```
   //bloquea el avance del vehiculo
   void bloquear() {
      avance_bloqueado = TRUE;
   }

   ...

   void actualizar_desplazamiento() {
        
       switch (estado_auto) {

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

           ...
        }

   ```

4. OPT El sistema debe indicar mediante una serie de LEDs el estado de movimiento
del vehículo.

No se cumplió con el objetivo opcional, ya que se buscó simplificar el diseño
del poncho. 

##### Control Remoto

1. El sistema debe establecer una conexión bluetooth con el sistema de control remoto.
   
   Se cumplió con el objetivo, utilizando un módulo Bluetooth HM-10 provisto por
   la cátedra.

2. El sistema debe leer las indicaciones del control remoto y ejecutar las acciones correspondientes.
   
   Se cumplió con el objetivo, utilizando como control remoto una aplicación de
   celular, cuyo funcionamiento ya fue detallado con anterioridad.

3. El sistema debe indicar mediante un LED el estado de la conexión bluetooth.
   
   Se utilizó el LED que viene incluído en el módulo HM-10, que indica con una
   luz parpadeante si recibe alimentación, y una luz constante si se realizó la
   conexión. 

##### OPT Medición Sensores

1. Ante ausencia de luz externa, se deben encender las luces del vehículo
   
   No se cumplió con el objetivo, por demanda de tiempo y para simplificar el
   diseño del poncho.
   
2. Ante la presencia de obstáculos, se debe frenar el desplazamiento en esa dirección.

   Se cumplió con el objetivo, utilizando un sensor de proximidad ultrasónica,
   HC-SR04. Al utilizar un único sensor, con ángulo de visión de 15°, el
   vehículo solo frena el desplazamiento hacia adelante.
   
#### Requerimientos de Hardware

##### Control de Motores

1. El vehículo debe utilizar puentes H para motores de corriente continua.
   
   Se cumplió con el objetivo, utilizando dos integrados L293D, dónde cada uno
   posee dos puentes H.

2. OPT El vehículo debe indicar con un LED para cada motor si este está en
   movimiento. 

   No se cumplió con el objetivo, para simplificar el diseño del poncho.

##### Baterías y cargador

1. El vehículo debe utilizar baterías de Litio para lograr la autonomía del vehículo
   
   Se cumplió con el objetivo, utilizando dos baterías de Litio en serie
   obteniendo una tensión de alimentación de aproximadamente 8V.

2. El vehículo debe indicar mediante un LED cuando haya baja tensión
   
   No se cumplió con el objetivo, no se pudo encontrar una manera sencilla de
   implementarlo.

3. El vehículo debe permitir cargar las baterías mediante un puerto USB.
   
   No se cumplió con el objetivo, ya que cargar el dispostivo con todos los
   componentes conectados podría generar problemas eléctricos.

##### Componentes

1. Se debe contar con una llave de encendido/apagado y un LED que determine su
   estado. 
   
   Se cumplió con el objetivo, se cuenta con una llave y varios LEDs que indican
   estado, ya que hay LEDs de alimentación en el Poncho, en la EDU-CIAA y en el
   módulo Bluetooth.
 
2. OPT El sistema debe poseer un buzzer para indicar eventos o fallas
   
   Se cumplió con el objetivo, el buzzer cumple dos funciones; notificar la presencia
   de obstáculos antes de bloquear el avance e indicar si el vehículo está
   retrocediendo. 
   
### Requerimientos No Funcionales

* Utilizacion de la placa de desarrollo EDU-CIAA.
* Estructura sólida y liviana, donde se colocan los motores y la EDU-CIAA.
* El conexionado a los motores debe ser a través de borneras para poder cambiar
  la estructura. 
* Programación en lenguaje C.
* Desarrollo de PCB en formato de poncho.
* Mecanismo de control simple.
* El sistema debe manejar respuestas en tiempo real.
* Fecha de finalización y entrega del proyecto el día 16/12.

Se cumplieron todos los requerimientos no funcionales en tiempo y forma.

### Evaluación

El grado de cumplimiento de los objetivos, en general, fue altamente positivo.
Los requerimientos funcionales que no se llevaron a cabo fueron los de menor
prioridad, la mayoría relacionados al hardware, debido a que implicaban un costo
de implementación muy alto para obtener una funcionalidad muy reducida. Por
ejemplo, el caso de colocar un led que indique el estado de cada motor, lo cual
costaría 4 pines GPIO, más toda su interconexión, aumentando aún más la
complejidad del poncho.

El principal cambio realizado fue el uso de una placa doble faz, por dos
motivos: 

1. Obtener un plano de tierra para disipar el calor producido por los integrados
   L293D.

2. Facilitar la conexión a tierra de los componentes, junto con el uso de
   puentes.

Otro cambio fue el uso de una sola fuente step-down. En un principio la
alimentación iba a consistir de dos pilas de litio en paralelo, las cuales entregarían
aproximadamente 4v, y creíamos que sería necesario utilizar dos conversores; un
conversor step-up para alimentar los L293D con 8v, y un conversor step-down
para alimentar la EDU-CIAA con 3.3v.  

Una vez estudiada mejor la arquitectura de la EDU-CIAA, observamos que se
alimentaba con 5v, y que internamente tiene un conversor a 3.3v para aquellos
puertos o componentes que necesiten de dicha tensión. Por este motivo, cambiamos
las pilas de paralelo a serie para obtener 8v que alimentan directamente a los
L293D, y utilizamos una fuente step-down para alimentar la EDU-CIAA con 5v a
través del conector Molex para alimentación externa. 
 
Un error que cometimos fue implementar mal la huella del conversor step-down,
la cual quedó completamente espejada, por lo que hubo que colocarla sobre pines, y
la tierra soldarla sobre el plano en lugar de atravezando la placa.

## Actividad de los integrantes

| Tarea  | Descripción  | Tiempo   |
| ----- | ------------------- | --- |
| Compra de componentes | Se obtuvieron los componentes electrónicos principales, los puentes H (L293D) no se consiguieron individualmente por lo que se compró un shield de Arduino que posee 2. Todos los componentes fueron comprados en La Plata salvo las ruedas y motores. Componentes que requerían valores precisos como resistencias y capacitores se fueron comprando a medida que se concretaba el diseño.   | 3 Horas |
| Estudio BT   | Mediante el uso de un módulo HM-10, el programa Hércules, la sAPI y un aplicación para Android, se estudió el funcionamiento de la comunicación Bluetooth. Se pudo concluir lo descripto en la sección de Software, Bluetooth. | 8 Horas |
| Arquitectura de Software | Se diseño la estructura principal del programa, como se describió en la sección de software | 4 Horas |
| Estudio L293D | Leyendo las datasheets del L293D y con recomendaciones de la cátedra, se llegó a un diseño para la PCB que cumplía con los requisitos eléctricos y térmicos. Además aquí también se incluye la investigación del módulo PWM de la EDU-CIAA, para poder controlar la potencia de los motores | 8 horas |
| Prototipo L293D | Se utilizó un Arduino y el Shield mencionado para probar algunos motores y el funcionamiento de los puentes H | 8 horas |
| Estudio de sensores | Se investigó principalmente el funcionamiento del sensor de proximidad HC-SR04 | 4 horas |
| Estudio de batería | Se vieron diferences opciones para la implementación de las baterías, la caída de tensión en el L293D, tensión de las pilas de litio | 2 horas  |
| Desarrollo de Software prioritario | Se implementaron las partes más importantes del programa, el control de motores y la comunicación Bluetooth | 8 horas |
| Estructura | Se dejó para el final para centrarnos en la investigación y desarrollo del poncho | 4 horas |
| Prototipo de Estructura | El prototipo fue una precaria caja de zapatos, como se puede observar en las fotos | 4 horas |
| Diseño de PCB | El diseño de la PCB fue evolucionando constantemente, la estructura y disposición de los componentes se mantuvo pero se fueron optimizando las pistas. | 16 horas |
| Fabricación de PCB | La PCB se fabricó en el ATEI con ayuda de Alejandro | 6 horas |
| Desarrollo de software secundario | No se cumplió con el cronograma original, y se desarrollo los últimos días | 6 horas |
| Montaje | Se soldaron los componentes, se colocaron los motores, tornillos de montaje, y porta pilas | 6 horas |
| Elección de baterías | Dado el tamaño solo cabían dos pilas, las necesarias para llegar 8v. | 2 minutos |
| Calibración de Motores | Se reguló la velocidad y se verificó que el mapeo de software coincida con la implementación en hardware | 30 minutos |
| Validación | Se verificó que el poncho y el software funciona correctamente y de acuerdo a lo especificado. Hubo que reprogramar diveros sectores, como el sensor de proximidad, que no actuaban acorde a lo especificado | 12 horas |

## Presupuesto

| Producto | Precio |
| -----    | ---    |
| Shield motor driver arduino | $ 350 |
| Ruedas con caja reductora y motores | $ 1200 |
| Porta pilas de litio | $ 150 |
| Placa virgen 10x15 doble faz | $ 180 |
| Mini switch | $ 45 |
| HC-SR04 | $ 170 |
| Tira de 2x40 pines macho  | $ 80 |
| Step Down mini 360  | $ 150 |
| Buzzer | $ 30 |
| Resistencias/capacitores/leds/varios  | $ 200 |
| Transistor 2n7000  | $ 20 |
| Hoja A4 papel fotográfico  | $ 20 |
| Horas de ingeniería (400hs.) | $ 72000 |
| Total  | $ 74595 |
