const int sensorPin = A1;   // select the input pin for the potentiometer
int sensorValue = 0;  // variable to store the value coming from the sensor
void setup() {
  pinMode(sensorPin,INPUT);
  analogReference(INTERNAL1V1);
  Serial.begin(9600);
}

void loop() {
  // read the value from the sensor:
  sensorValue = analogRead(sensorPin);
  sensorValue = abs(sensorValue);
  float voltage =  sensorValue*(1.1/ 1023.0);
  Serial.println(voltage,5);
  // stop the program for <sensorValue> milliseconds:
  delay(50);
}
