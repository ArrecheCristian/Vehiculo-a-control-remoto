# Guía de trabajos prácticos Nº1
## EDU-CIAA
A. 
### Características generales
* Microcontrolador LPC4337 (dual core ARM Cortex-M4F y Cortex-M0).
* 2 puertos micro-USB (uno para aplicaciones y debugging, otro para alimentación).
* 4 salidas digitales implementadas con leds RGB.
* 4 entradas digitales con pulsadores.
* 1 puerto de comunicaciones RS 485 con bornera.
* 2 conectores de expansión:
  * P1:
    * 3 entradas analógicas (ADC0_1,2y3),
    * 1 salida analógica (DAC0),
    * 1 puerto I2C,
    * 1 puerto asincrónico full duplex (para RS-232).
    * 1 puerto CAN,
    * 1 conexión para un teclado de 3×4,
  * P2:
    * 1 puerto Ethernet,
    * 1 puerto SPI,
    * 1 puerto para Display LCD con 4 bits de datos, Enable y RS.
    * 9 pines genéricos de I/O.

B.
### LEDS
* LED0
  * R: P2_0
  * G: P2_1
  * B: P2_2
* LED1: P2_10
* LED2: P2_11
* LED3: P2_12

### Pulsadores
PULS0: P1_0
PULS1: P1_1
PULS2: P1_2
PULS3: P1_6

C.
### Cargar un programa en la EDU-CIAA
* Escribir en board.mk
  * BOARD = edu_ciaa_nxp
* Escribir en program.mk
  * PROGRAM_PATH = examples/c
  * PROGRAM_NAME = app
* Con la consola
  * make clean
  * make
  * make download








## Microcontrolador LPC4337

A.Investigue y haga un resumen de las características más destacadas del MCU LPC4337. Describa la arquitectura interna y enumere los periféricos que contiene (ver Data Sheet y Manual de usuario en la sección descargas de la web).
#### Características
* 1 núcleo Cortex-M4
  * Frecuencias hasta 204Mhz
* 1 núcleo Cortex-M0
  * Frecuencias hasta 204Mhz
* Memoria On-chip
  * 1 MB memoria flash
  * 16 KB de memoria EEPROM de datos
  * 136 KB SRAM para código y datos
  * 64 KB de memoria ROM para boot y drivers
  * 64 bit + 256 bit de memoria OTP (One-Time-Programmable) para uso de propósito general 
* Perifericos
  * 
* ARQ interna
  * ARM 32 bits
  * RISC

C.Investigue cuales son los registros del MCU para configurar un GPIO como salida y las diferentes maneras de modificar el estado de dicha salida. 

y 

D.Ídem anterior para configurar un GPIO como entrada y leer su estado.

* Configuración de los GPIO
  * gpioConfig( GPIO0, GPIO_INPUT );
  * gpioConfig( GPIO1, GPIO_OUTPUT );
* Para leer y escribir
  * valor = !gpioRead( TEC3 );
  * Es activo en bajo, por eso lo niega antes de escribirlo en el GPIO
  * gpioWrite( LED2, valor );

E. Para programar en C los puertos GPIO se pueden utilizar las bibliotecas LPCOpen, (de NXP para micros LPC). Investigue cuales son las funciones de esta biblioteca para configurar y utilizar los puertos GPIO (Nota: la sAPI utiliza estas bibliotecas).

Hay un monton de funciones en /libs/lpcopen, no tiene sentido aprenderselas de memoria.
Dos de las mas importantes son:
* void Chip_GPIO_Init(LPC_GPIO_T *pGPIO)

* void Chip_GPIO_DeInit(LPC_GPIO_T *pGPIO)

F. Investigue que es y cómo funciona el periférico SysTick incluido en el Core ARM-Cortex M4 utilizado como temporizador del sistema.

### SysTick

* Timer de 24 bits
* Cuenta decrementando desde el valor guardado en el registro SYST_RVR
* Cuando llega a 0, vuelve a ponerse en el valor SYST_RVR y vuelve a contar
* Los registros del timer son:
  * SYST_CSR
    * Control and status register
  * SYST_RVR
    * Reload value register
  * SYST_CVR
    * Current value register
  * SYST_CALIB
    * Calibration value register

G. Investigue en el manual de usuario como es y cómo funciona el periférico USART. Realice un resumen de características y un diagrama en bloques en particular para USART2 que se utilizará en la práctica. Compare este periférico con el SCI de los MCU S08 utilizados en CDyMC.

USART (Universal Synchronous/Asynchronous Receiver Transmitter ó Transmisor-Receptor Síncrono/Asíncrono Universal) es un protocolo empleado en comunicaciones duales, es decir que está en la capacidad de recibir y transmitir simultáneamente. Los datos son transmitidos de manera serial, lo que significa que sólo un bit es transferido por el canal al tiempo. Las interfaces seriales son sencillas y baratas de implementar, motivo por el cual fueron el sistema más común de comunicación electrónica hasta la aparición del protocolo USB.

The APB interface provides a communications link between the CPU or host and the
USART.
The USART receiver block, RX, monitors the serial input line, RXD, for valid input. The
USART RX Shift Register (RSR) accepts valid characters via RXD. After a valid character
is assembled in the RSR, it is passed to the USART RX Buffer Register FIFO to await
access by the CPU or host via the generic host interface.
The USART transmitter block, TX, accepts data written by the CPU or host and buffers the
data in the USART TX Holding Register FIFO (THR). The USART TX Shift Register (TSR)
reads the data stored in the THR and assembles the data to transmit via the serial output
pin, TXD1.
The USART Baud Rate Generator block, BRG, generates the timing enables used by the
USART TX and RX blocks. The BRG clock input source is PCLK. The main clock is
divided down per the divisor specified in the DLL and DLM registers. This divided down
clock is a 16x oversample clock, NBAUDOUT.
The interrupt interface contains registers IER and IIR. The interrupt interface receives
several one clock wide enables from the TX and RX blocks.
Status information from the TX and RX is stored in the LSR. Control information for the TX
and RX is stored in the LCR.