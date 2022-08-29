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
    //Serial1.begin(9600);
    Serial1.begin(9600);
    
    pinMode(CS_1, OUTPUT);
    pinMode(CS_2, OUTPUT);
    pinMode(CS_3, OUTPUT);
    
    digitalWrite(CS_1, HIGH); //Logic HIGH on all ADS1118 chip select pins on startup (!CS means active low)
    digitalWrite(CS_2, HIGH);
    digitalWrite(CS_3, HIGH);
    

    digitalWrite(CS_3, LOW);
    a3.begin(); //Initialize the ADS1118. Default setting: PULLUP RESISTOR, ADC MODE, RATE 8SPS, SINGLE SHOT, ±0.256V, DIFFERENTIAL AIN0-AIN1
    a3.setContinuousMode();
    a3.setSamplingRate(a3.RATE_16SPS);
    a3.setFullScaleRange(a3.FSR_0256);
    a3.enablePullup();  //MUST
    digitalWrite(CS_3, HIGH);

    digitalWrite(CS_2, LOW);
    a2.begin(); //Initialize the ADS1118. Default setting: PULLUP RESISTOR, ADC MODE, RATE 8SPS, SINGLE SHOT, ±0.256V, DIFFERENTIAL AIN0-AIN1
    a2.setContinuousMode();
    a2.setSamplingRate(a2.RATE_16SPS);
    a2.setFullScaleRange(a2.FSR_0256);
    a2.enablePullup();  //MUST
    digitalWrite(CS_2, HIGH);

    digitalWrite(CS_1, LOW);
    a1.begin(); //Initialize the ADS1118. Default setting: PULLUP RESISTOR, ADC MODE, RATE 8SPS, SINGLE SHOT, ±0.256V, DIFFERENTIAL AIN0-AIN1
    a1.setContinuousMode();
    a1.setSamplingRate(a1.RATE_16SPS);
    a1.setFullScaleRange(a1.FSR_0256);
    a1.enablePullup();  //MUST
    digitalWrite(CS_1, HIGH);

    
  Serial1.println("TC setup complete.");


  Wire.begin();
  if( !kxAccel.begin() ){
    Serial1.println("KX132 offline");
  }

  if( !kxAccel.initialize(DEFAULT_SETTINGS)){ // Loading default settings.
    Serial1.println("Could not initialize the IMU.");
  }
  else
    Serial1.println("IMU ready.");
    
}


void loop(){      //output format: t1,2,3,4,5,6, int1,2,3, x,y,z, pitch,roll
 Serial1.print("/*"); //frame start
 returnTemp();
 readIMU();
 Serial1.print("*/"); //frame end
 Serial1.println();
}

void returnTemp(){

    double iT1, iT2, iT3;
    
    digitalWrite(CS_3, LOW);  //enable
    
    readTC(a3.getMilliVolts(a3.DIFF_0_1),a3.getTemperature());
    readTC(a3.getMilliVolts(a3.DIFF_2_3),a3.getTemperature());
    iT3 = a3.getTemperature();
    
    digitalWrite(CS_3, HIGH); //disable
    
    digitalWrite(CS_2, LOW);

    readTC(a2.getMilliVolts(a2.DIFF_0_1),a2.getTemperature());
    readTC(a2.getMilliVolts(a2.DIFF_2_3),a2.getTemperature());
    iT2 = a2.getTemperature();

    digitalWrite(CS_2, HIGH);

    digitalWrite(CS_1, LOW);

    readTC(a1.getMilliVolts(a1.DIFF_0_1),a1.getTemperature());
    readTC(a1.getMilliVolts(a1.DIFF_2_3),a1.getTemperature());
    iT1 = a1.getTemperature();

    digitalWrite(CS_1, HIGH);
    
   Serial1.print(iT1);   Serial1.print(", "); //print internal temperatures
   Serial1.print(iT2);   Serial1.print(", ");
   Serial1.print(iT3);   Serial1.print(", ");   
}

void readTC(double diff_volt_mV, double cold_junc_C){
  double hot_junc_C;
  int32_t return_val;
  
  return_val = ReclaimerLabs_Thermocouple::calc_temp(TYPE_K, diff_volt_mV, cold_junc_C, &hot_junc_C);
  Serial1.print(hot_junc_C,1);
  Serial1.print(",");
}

void readIMU(){

  double x_Buff = float(IMUData.xData);
  double y_Buff = float(IMUData.yData);
  double z_Buff = float(IMUData.zData);
  
  IMUData = kxAccel.getAccelData(); 
  
  Serial1.print(IMUData.xData, 4); Serial1.print(", "); //acceleration X
  Serial1.print(IMUData.yData, 4); Serial1.print(", "); //acceleration Y
  Serial1.print(IMUData.zData, 4); Serial1.print(", "); //acceleration Z

  roll = atan2(y_Buff , z_Buff) * 57.3;
  pitch = atan2((- x_Buff) , sqrt(y_Buff * y_Buff + z_Buff * z_Buff)) * 57.3;
  Serial1.print(roll); Serial1.print(", ");
  Serial1.print(pitch);
}
