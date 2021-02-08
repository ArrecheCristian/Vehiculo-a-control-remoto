## Pruebas y ensayos

### Motores y L293D

Con el objetivo de observar el funcionamiento del L293D y los motores, y
verificar si estos eran capaces de mover el vehículo con todos los componentes a
una velocidad aceptable.

El ensayo se realizó con un Arduino y el shield que contiene dos L293D,
configurando el PWM con un ciclo de trabajo del 100%. El código de prueba para
el Arduino es el siguiente:

```
#include <AFMotor.h>

AF_DCMotor motor1(1);                   //Declara los motores a utilizar
AF_DCMotor motor2(2);
AF_DCMotor motor3(3);
AF_DCMotor motor4(4);

void setup() {
  Serial.begin(9600);                   //Inicializa la terminal serie a 9600 bps
  Serial.println("Prueba de motores");

  motor1.run(RELEASE);                  //Desbloquea el motor
  motor1.run(FORWARD);                  //Mueve para adelante
  motor1.setSpeed(255);                 //Velocidad entre 0 y 255, configurada al máximo

  motor2.run(RELEASE);
  motor2.run(FORWARD);
  motor2.setSpeed(255);

  motor3.run(RELEASE);
  motor3.run(FORWARD);
  motor3.setSpeed(255);

  motor4.run(RELEASE);
  motor4.run(FORWARD);
  motor4.setSpeed(255);
}

void loop() {
}
```

#### Conclusiones

Los motores son lo suficientemente potentes como para mover el vehículo a una
velocidad considerable, siempre y cuando los L293D sean alimentados con
aproximadamente 8V, ya que hay una diferencia entre la entrada del L293D y la
salida a cada uno de los motores de ~=2V (los motores van a su máxima velocidad
con 6V).

### Sensor HC-SR04

Una vez ensamblado el auto en su correspondiente chásis en conjunto con la
totalidad de sus componentes, realizamos las pruebas de deteccion de objetos.
Estas pruebas consistieron en direccionar el auto hacia un obstáculo,
contemplando el margen de frenado requerido para que el vehículo no choque
contra dicho obstáculo, realizando sucesivas modificaciones en las variables de
distancia de frenado hasta dar con la indicada. El codigo en cuestion se muestra
a continuacion:
 
```   
void evaluar_colisiones() {

	// obtenemos la distancia actual
	distancia = ultrasonicSensorGetDistance(ULTRASONIC_SENSOR_0, CM);

	// antes de frenar por un obstaculo, se activa el buzzer para indicar la presencia del mismo
	if(distancia <= 100 && auto_avanzando()){
		sonido_colision();
	}else{
		desactivar_buzzer();
	}

	//Activamos el led de estado cuando detectamos una colisi�n
	if(distancia <= 30){
		activar_led_colision();
		bloquear();
	}else{
		desactivar_led_colision();
		desbloquear();
	}


}
```

### Control remoto

Por simplicidad, se utilizó una aplicación disponible en el play store de
Android, llamada BLEJoystick para manejar el vehículo via el protocolo BLE y el módulo HM-10. 
Se probó el funcionamiento del bluetooth utilizando el programa de ejemplo que
viene en la librería SAPI para el uso del módulo HM-10, y el programa Hercules,
que permite visualizar todos los comandos enviados desde la aplicación.
Luego de configurar el Hercules en modo serie, y encontrar el puerto COM donde
estaba conectada la EDU-CIAA, pudimos ver que la aplicación funcionaba
correctamente, enviando el caracter correspondiente según la tecla presionada.

```
// FUNCION PRINCIPAL, PUNTO DE ENTRADA AL PROGRAMA LUEGO DE ENCENDIDO O RESET.
int main( void )
{
   // ---------- CONFIGURACIONES ------------------------------

   // Inicializar y configurar la plataforma
   boardConfig();

   // Inicializar UART_USB para conectar a la PC
   uartConfig( UART_PC, 9600 );
   uartWriteString( UART_PC, "UART_PC configurada.\r\n" );

   // Inicializar UART_232 para conectar al modulo bluetooth
   uartConfig( UART_BLUETOOTH, 9600 );
   uartWriteString( UART_PC, "UART_BLUETOOTH para modulo Bluetooth configurada.\r\n" );
   
   uint8_t data = 0;
   
   uartWriteString( UART_PC, "Testeto si el modulo esta conectado enviando: AT\r\n" );
   if( hm10bleTest( UART_BLUETOOTH ) ){
      uartWriteString( UART_PC, "Modulo conectado correctamente.\r\n" );
   }
   else{
      uartWriteString( UART_PC, "No funciona.\r\n" );
   }

   // ---------- REPETIR POR SIEMPRE --------------------------
   while( TRUE ) {

      // Si leo un dato de una UART lo envio a al otra (bridge)
      if( uartReadByte( UART_PC, &data ) ) {
         uartWriteByte( UART_BLUETOOTH, data );
      }
      if( uartReadByte( UART_BLUETOOTH, &data ) ) {
         if( data == 'h' ) {
            gpioWrite( LEDB, ON );
         }
         if( data == 'l' ) {
            gpioWrite( LEDB, OFF );
         }
         uartWriteByte( UART_PC, data );
      }
      
      // Si presiono TEC1 imprime la lista de comandos AT
      if( !gpioRead( TEC1 ) ) {
         hm10blePrintATCommands( UART_BLUETOOTH );
         delay(500);
      }
      
      // Si presiono TEC3 enciende el led de la pantalla de la app
      if( !gpioRead( TEC3 ) ) {
         uartWriteString( UART_BLUETOOTH, "LED_ON\r\n" );
         delay(500);
      }
      // Si presiono TEC4 apaga el led de la pantalla de la app
      if( !gpioRead( TEC4 ) ) {
         uartWriteString( UART_BLUETOOTH, "LED_OFF\r\n" );
         delay(500);
      }
   }

   // NO DEBE LLEGAR NUNCA AQUI, debido a que a este programa se ejecuta
   // directamenteno sobre un microcontroladore y no es llamado por ningun
   // Sistema Operativo, como en el caso de un programa para PC.
   return 0;
}
```

### Buzzer

Al igual que con el sensor HC-SR04 los ensayos se realizaron con el auto una vez
ensamblado. Determinamos la necesidad de utilizar dos tipos de intermitencias 
para diferenciar la deteccion de un obstaculo con la reversa de vehiculo. 
La practica de dicho ensayo no implicó ningun inconveniente ya que solo consitió en 
modificar el código a gusto de manera que los tiempos sean los buscados.

```
void actualizar_buzzer(){
	if(tipo_de_sonido==1){
		contador++;
		if(contador==2){
			estado_buzzer=!estado_buzzer;
			gpioWrite(GPIO6, estado_buzzer);
			contador=0;
		}
	}

	if(tipo_de_sonido==2){
		contador++;
		if(contador==5){
			estado_buzzer=!estado_buzzer;
			gpioWrite(GPIO6, estado_buzzer);
			contador=0;
		}
	}
```

### Baterías de litio

En base a mediciones realizadas previamente en la etapa de protipado,
encontramos conveniente utilizar dos baterias de litio, cuya capacidad máxima de
carga individual fue de 4v, lo cual a partir de su conexion en serie nos
permitió obtener los 8v requeridos para la alimentación de los L293D así como
también alimentar la EDU-CIAA con 5v gracias a la fuente step-down.

### Fuente step down

Una vez corregida la disposición de la fuente step-down, se procedió a
calibrarla, desconectando el resto de los componentes. Midiendo la tensión de
salida con un multímetro, se llevó la tensión de salida a 5v, lo necesario para
alimentar la EDU-CIAA.
