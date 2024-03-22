/*
 Get scaled and calibrated output of MPU6050
 */

#include <basicMPU6050.h> 

// Create instance
basicMPU6050<> imu;

void setup() {
  // Set registers - Always required
  imu.setup();

  // Initial calibration of gyro
  imu.setBias();

  // Start console
  bluetooth.begin(38400);
}

void loop() { 
  // Update gyro calibration 
  imu.updateBias();
 
  //-- Scaled and calibrated output:
  // Accel
  bluetooth.print( imu.ax() );
  bluetooth.print( " " );
  bluetooth.print( imu.ay() );
  bluetooth.print( " " );
  bluetooth.print( imu.az() );
  bluetooth.print( "    " );
  
  // Gyro
  bluetooth.print( imu.gx() );
  bluetooth.print( " " );
  bluetooth.print( imu.gy() );
  bluetooth.print( " " );
  bluetooth.print( imu.gz() );
  bluetooth.print( "    " );  
  
  // Temp
  bluetooth.print( imu.temp() );
  bluetooth.println(); 
}
