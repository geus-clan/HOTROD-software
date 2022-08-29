/**
 * PAINTREsoft V3 ----- Chris Shields, 2022, clan@geus.dk
 * CC-BY-SA
 * 
 * Reads three on-board ADS1118 ADCs configured for reading K-type thermocouples embedded in heating cartridges
 * Polls an external KX132 breakout board (SparkFun)
 * Builds and transmits a string back to mission control.
 * 
 * Contact for further details.
 * 
 * Most code for interfacing KX13x and ADS1118 adapted from their respective library examples and datasheets. Many thanks to the authors.
 * 
 */

#include "ADS1118.h"
#include <SPI.h>
#include <Wire.h>
#include <ReclaimerLabs_Thermocouple.h>
#include <elapsedMillis.h>
#include "SparkFun_Qwiic_KX13X.h"

#define CS_1 A1
#define CS_2 A2
#define CS_3 A3

ADS1118 a3(CS_3);
ADS1118 a2(CS_2);
ADS1118 a1(CS_1);

QwiicKX132 kxAccel;

outputData IMUData; // This will hold the accelerometer's output. 
double roll = 0.00, pitch = 0.00;       //Roll & Pitch are the angles which rotate by the axis X and y


void setup(){
    Serial.begin(9600);
    Serial1.begin(9600);
    
  Wire.begin();
  if( !kxAccel.begin() ){
    Serial.println("KX132 offline");
  }

  if( !kxAccel.initialize(DEFAULT_SETTINGS)){ // Loading default settings.
    Serial.println("Could not initialize the IMU.");
  }
  else
    Serial.println("IMU ready.");  

  a3.begin();
  a2.begin(); //Initialize the ADS1118. Default setting: PULLUP RESISTOR, ADC MODE, RATE 8SPS, SINGLE SHOT, ±0.256V, DIFFERENTIAL AIN0-AIN1
  a1.begin();
    
    digitalWrite(CS_1, LOW); //Logic low on all ADS1118 chip select pins on startup
    digitalWrite(CS_2, LOW);
    digitalWrite(CS_3, LOW);

 
    a1.setSamplingRate(a2.RATE_8SPS);             //Using the setter method to change the sampling rate
    a1.setContinuousMode();                            //Using the setter method to set it to continuous mode
    a1.enablePullup();                                 //Using the setter method to enable the pull-up resistor in Dout
    
    a2.setSamplingRate(a2.RATE_8SPS);             //Using the setter method to change the sampling rate
    a2.setContinuousMode();                            //Using the setter method to set it to continuous mode
    a2.enablePullup();                                 //Using the setter method to enable the pull-up resistor in Dout

    a3.setSamplingRate(a2.RATE_8SPS);             //Using the setter method to change the sampling rate
    a3.setContinuousMode();                            //Using the setter method to set it to continuous mode
    a3.enablePullup();  
    
  Serial.print("TC setup complete.");

}


void loop(){      //output format: t1,2,3,4,5,6, int1,2,3, x,y,z, pitch,roll
 Serial.print("/*"); //frame start
 returnTemp();
 readIMU();
 Serial.print("*/"); //frame end
 Serial.println();
}

void returnTemp(){
   digitalWrite(CS_1,LOW);
   digitalWrite(CS_2,LOW);
   digitalWrite(CS_3,LOW);

   double iT1, iT2, iT3;
   iT1 = a1.getTemperature(); //find cold junction temps (needed for TC calculations)
   iT2 = a2.getTemperature();
   iT3 = a3.getTemperature();


    readTC(a3.getMilliVolts(a3.DIFF_0_1),iT3);
    readTC(a3.getMilliVolts(a3.DIFF_2_3),iT3);
    readTC(a2.getMilliVolts(a2.DIFF_0_1),iT2);
    readTC(a2.getMilliVolts(a2.DIFF_2_3),iT2);
    readTC(a1.getMilliVolts(a1.DIFF_0_1),iT1);
    readTC(a1.getMilliVolts(a1.DIFF_2_3),iT1);
  
Serial.print("\t");

   Serial.print(iT1);   Serial.print(", "); //print internal temperatures
   Serial.print(iT2);   Serial.print(", ");
   Serial.print(iT3);   Serial.print(", ");  
   
   Serial.print("\t");
 
}

void readTC(double diff_volt_mV, double cold_junc_C){
  double hot_junc_C;
  int32_t return_val;
  
  return_val = ReclaimerLabs_Thermocouple::calc_temp(TYPE_K, diff_volt_mV, cold_junc_C, &hot_junc_C);
  Serial.print(hot_junc_C);
  Serial.print(",");
}

void readIMU(){

  double x_Buff = float(IMUData.xData);
  double y_Buff = float(IMUData.yData);
  double z_Buff = float(IMUData.zData);
  
  IMUData = kxAccel.getAccelData(); 
  
  Serial.print(IMUData.xData, 4); Serial.print(", "); //acceleration X
  Serial.print(IMUData.yData, 4); Serial.print(", "); //acceleration Y
  Serial.print(IMUData.zData, 4); Serial.print(", "); //acceleration Z

  roll = atan2(y_Buff , z_Buff) * 57.3;
  pitch = atan2((- x_Buff) , sqrt(y_Buff * y_Buff + z_Buff * z_Buff)) * 57.3;
  Serial.print(roll); Serial.print(", ");
  Serial.print(pitch);
}
