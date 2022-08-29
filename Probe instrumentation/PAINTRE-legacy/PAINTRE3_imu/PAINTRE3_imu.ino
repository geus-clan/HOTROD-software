/*********************************************************
Author: Elias Santistevan @ SparkFun Electronics
Date: 5/2021
Library repository can be found here:
https://github.com/sparkfun/SparkFun_KX13X_Arduino_Library

Basic example for reading back accelerometer values using I2C. 

This code is released under the [MIT License](http://opensource.org/licenses/MIT).

Please review the LICENSE.md file included with this example. If you have any questions 
or concerns with licensing, please contact techsupport@sparkfun.com.

Distributed as-is; no warranty is given.
*******************************************************/

#include <Wire.h>
#include "SparkFun_Qwiic_KX13X.h"

QwiicKX132 kxAccel;
//QwiicKX134 kxAccel; // Uncomment this if using the KX134 - check your board
                      //if unsure.  
outputData myData; // This will hold the accelerometer's output. 
double roll = 0.00, pitch = 0.00;       //Roll & Pitch are the angles which rotate by the axis X and y

void setup() {


  while(!Serial){
    delay(50);
  }
  

  Serial.begin(115200);
  Serial1.begin(115200);

  Serial.println("Welcome.");

  Wire.begin();
  if( !kxAccel.begin() ){
    Serial.println("Could not communicate with the the KX13X. Freezing.");
    while(1);
  }
  else
    Serial.println("Ready.");
    


  if( !kxAccel.initialize(DEFAULT_SETTINGS)){ // Loading default settings.
    Serial.println("Could not initialize the chip.");
    while(1);
  }
  else
    Serial.println("Initialized...");

  // kxAccel.setRange(KX132_RANGE16G);
  // kxAccel.setRange(KX134_RANGE32G); // For a larger range uncomment

}

void loop() {

  myData = kxAccel.getAccelData(); 
  /*Serial.print("X: ");
  Serial.print(myData.xData, 4);
  Serial.print("g ");
  Serial.print(" Y: ");
  Serial.print(myData.yData, 4);
  Serial.print("g ");
  Serial.print(" Z: ");
  Serial.print(myData.zData, 4);
  Serial.println("g ");
  */
  


  RP_calculate();

  Serial1.print("g");
  
  delay(20); // Delay should be 1/ODR (Output Data Rate), default is 50Hz

}

void RP_calculate(){
  double x_Buff = float(myData.xData);
  double y_Buff = float(myData.yData);
  double z_Buff = float(myData.zData);
  roll = atan2(y_Buff , z_Buff) * 57.3;
  pitch = atan2((- x_Buff) , sqrt(y_Buff * y_Buff + z_Buff * z_Buff)) * 57.3;
  Serial.printf("roll = %f, pitch = %f", roll, pitch);
  Serial.println();
}
