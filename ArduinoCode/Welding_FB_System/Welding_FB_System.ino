#include <NewPing.h>
#include <SoftwareSerial.h>
#include <basicMPU6050.h>
basicMPU6050<> imu; // Create instance
SoftwareSerial bluetooth(19,18); //Defines the Bluetooth comunication ports
#define VsensorPin A1  // select the input pin for the potentiometer
float sensorValue = 0;  // variable to store the value coming from the sensor
float distance = 0; // variable to store distance
float time = 0; // variable to help store time
#define TRIGGER_PIN  9
#define ECHO_PIN     10
#define MAX_DISTANCE 400 // Maximum distance we want to measure (in centimeters).
NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE); // NewPing setup of pins and maximum distance.

void setup() {
  pinMode(VsensorPin, INPUT);
   // Set registers - Always required
  imu.setup();
  // Initial calibration of gyro
  imu.setBias();
  //sets rate of the bluetooth
  bluetooth.begin(9600);
  Serial.begin(9600);
}
 
 
 /*
float Feedback_Data(float x, float y, float z) {
  // Converts the distance from inches into mm
  float distance = x;
  float voltage = y;
  float control = 355.6;
  // Equation for feed length of the rod at 120 amps
  float w = 0.0419 * sq(z) + 3.8947 * z + 2.4681;
  // Test the difference between ideal and the computed value
  float difference = abs(355.6 - w - x);
  // Check if both conditions are wrong
  if (difference > 20 && abs(voltage - 1.2) > .1) {
    return 1; // Alarm type 1
  }

  // Check if the difference exceeds 20 mm
  if (difference > 20) {
    return 2; // Alarm type 2
  }

  // Check if the voltage difference exceeds 3
  if (abs(voltage - 1.2) > .5) {
    return 3; // Alarm type 3
  }

  // No alarm, return 0
  return 0;
}
*/
 
 
void loop() {
  delay(1000)
  int distance = sonar.ping_cm(); // Send ping, get distance in cm
  sensorValue = abs(sensorValue);
  float voltage = sensorValue * (5 / 1023.0); // sample voltage data
  // Update gyro calibration 
  imu.updateBias();
  if (bluetooth.available()) {
    //voltage
    bluetooth.print("Current Sensor")
    bluetooth.println(voltage);
    //Distance
    bluetooth.print("Ultrasound Sensor")
    bluetooth.println(distance);
  /*int alarm = Feedback_Data(distance, voltage, time);
  if (alarm == 1) {
    digitalWrite(13, HIGH); // shows when distance is incorrect
    digitalWrite(12, HIGH); // shows when voltage is incorrect
  }
  else if (alarm == 2) {
    digitalWrite(12, HIGH); // shows when voltage is incorrect
    digitalWrite(13, LOW);
  }
  else if (alarm == 3){
    digitalWrite(13, HIGH); // shows when distance is incorrect
    digitalWrite(12, LOW);
  }
  else {
    digitalWrite(13, LOW); // reset for the LEDs
    digitalWrite(12, LOW);
  }
  delay(1000);
  */
}