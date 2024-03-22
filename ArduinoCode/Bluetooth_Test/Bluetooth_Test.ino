#include <SPI.h>

#define SS_PIN 10  // Slave Select pin for SPI
#define HM10_KEY "AT"

void setup() {
  Serial.begin(9600);       // Serial monitor for debugging
  SPI.begin();              // Initialize SPI communication
  pinMode(SS_PIN, OUTPUT);   // Set SS_PIN as an output
  digitalWrite(SS_PIN, HIGH);  // Deselect the HM-10 initially
}

void loop() {
  // Send an AT command to the HM-10 to read its responses
  sendCommand(HM10_KEY);

  // Check if data is available from the HM-10
  while (SPI.available()) {
    char receivedChar = SPI.transfer(0x00);  // Read one byte from the HM-10
    // Do something with the received data
    Serial.print("Received: ");
    Serial.println(receivedChar);
  }

  delay(1000);  // Add a delay to avoid excessive communication
}

void sendCommand(const char* command) {
  digitalWrite(SS_PIN, LOW);  // Select the HM-10
  delay(10);

  // Send each character in the command
  for (int i = 0; command[i] != '\0'; i++) {
    SPI.transfer(command[i]);
  }

  digitalWrite(SS_PIN, HIGH);  // Deselect the HM-10
  delay(10);
}
