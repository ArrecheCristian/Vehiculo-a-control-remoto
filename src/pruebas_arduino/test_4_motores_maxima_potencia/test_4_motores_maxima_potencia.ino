// Adafruit Motor shield library
// copyright Adafruit Industries LLC, 2009
// this code is public domain, enjoy!

#include <AFMotor.h>

AF_DCMotor motor1(1);
AF_DCMotor motor2(2);
AF_DCMotor motor3(3);
AF_DCMotor motor4(4);

void setup() {
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("Motor test!");

 
  motor1.run(RELEASE);
  motor1.run(FORWARD);
  motor1.setSpeed(255);

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
