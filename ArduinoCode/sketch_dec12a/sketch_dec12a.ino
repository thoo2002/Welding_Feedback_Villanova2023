#include <SoftwareSerial.h>
// Ultrasound Sensor pin
#define USsensorPin 2 
// select the input pin for the potentiometer
#define VsensorPin A1
#include <basicMPU6050.h> 
// Create instance
basicMPU6050<> imu;
//Defines the Bluetooth comunication ports
SoftwareSerial bluetooth(19,18); 
// variable to store the value coming from the sensor
float sensorValue = 0;
// variable to store distance
float distance = 0;
void setup() {
  pinMode(VsensorPin, INPUT);
  pinMode(USsensorPin, INPUT);
  // Set registers - Always required
  imu.setup();
  // Initial calibration of gyro
  imu.setBias();
  //sets rate of the bluetooth
  bluetooth.begin(9600);
  //sets rate of the console
  Serial.begin(9600);
}
void loop() {
  int duration = pulseIn(sensorPin, HIGH); //Turns on ultra sound sensor
	distance = duration / 58; //Calcuates Distance in cm of sensor
  sensorValue = analogRead(VsensorPin);
  sensorValue = abs(sensorValue);
  float voltage = sensorValue * (5 / 1023.0); // sample voltage data
  // Update gyro calibration 
  imu.updateBias();
  if (bluetooth.available()) {
    //voltage
    bluetooth.println(voltage);
    //Distance
    bluetooth.println(distance);
    //Accel
    bluetooth.print( imu.ax() );
    bluetooth.print( imu.ay() );
    bluetooth.print( imu.az() );
    // Gyro
    bluetooth.print( imu.gx() );
    bluetooth.print( imu.gy() );
    bluetooth.print( imu.gz() );  
    // Temp
    bluetooth.print( imu.temp() );
  delay(1000);
}