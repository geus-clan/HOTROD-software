/**
*  Example for Arduino Library for Texas Instruments ADS1118 - 16-Bit Analog-to-Digital Converter with 
*  Internal Reference and Temperature Sensor
*  
*  @author Alvaro Salazar <alvaro@denkitronik.com>
*  http://www.denkitronik.com
*
*/

#include "ADS1118.h"
#include <SPI.h>
#include <ReclaimerLabs_Thermocouple.h>


//Definition of the Arduino pin to be used as the chip select pin (SPI CS pin). Example: pin 5


#define CS_1 A1
#define CS_2 A2
#define CS_3 A3
//Creating an ADS1118 object (object's name is ads1118)
ADS1118 a3(CS_3);
ADS1118 a2(CS_2);
ADS1118 a1(CS_1);

void setup(){
    Serial.begin(115200);
    a3.begin();
    a2.begin(); //Initialize the ADS1118. Default setting: PULLUP RESISTOR, ADC MODE, RATE 8SPS, SINGLE SHOT, ±0.256V, DIFFERENTIAL AIN0-AIN1
    a1.begin();
    
    digitalWrite(CS_1, LOW); //Logic low on all ADS1118 chip select pins on startup
    digitalWrite(CS_2, LOW);
    digitalWrite(CS_3, LOW);

    a1.setSamplingRate(a2.RATE_8SPS);
    a1.setContinuousMode();                            
    a1.enablePullup();                                 
    
    a2.setSamplingRate(a2.RATE_8SPS);
    a2.setContinuousMode();
    a2.enablePullup();      
    
    a3.setSamplingRate(a2.RATE_8SPS);
    a3.setContinuousMode();
    a3.enablePullup();  
}


void loop(){
   /* Serial.println(String(a2.getTemperature(),6)+" C"); //Getting temperature
    //Serial.println(String(a2.getMilliVolts(),10)+"mV"); //Getting millivolts measured in the input selected
    
    Serial.println(String(a2.getMilliVolts(a2.DIFF_0_1),10)+"mV"); //Specifying the input to be selected
    Serial.println(String(a2.getMilliVolts(a2.DIFF_2_3),10)+"mV"); //Specifying the input to be selected
*/
   

    Serial.println(String(a1.getTemperature(),6)+" C"); //Getting temperature
    readTC(a3.getMilliVolts(a1.DIFF_0_1),a1.getTemperature());
    readTC(a3.getMilliVolts(a1.DIFF_2_3),a1.getTemperature());
    Serial.println();
    delay(200); //You can use a delay to save power. The ADS1118 will be in power down state during all the delay time. Optional

            Serial.print("\t");
    Serial.println(String(a2.getTemperature(),6)+" C"); //Getting temperature
            Serial.print("\t");
    readTC(a3.getMilliVolts(a2.DIFF_0_1),a2.getTemperature());
            Serial.print("\t");
    readTC(a3.getMilliVolts(a2.DIFF_2_3),a2.getTemperature());
    Serial.println();
    
    
            Serial.print("\t\t");
    Serial.println(String(a3.getTemperature(),6)+" C"); //Getting temperature
            Serial.print("\t\t");
    readTC(a3.getMilliVolts(a3.DIFF_0_1),a3.getTemperature());
            Serial.print("\t\t");
    readTC(a3.getMilliVolts(a3.DIFF_2_3),a3.getTemperature());
            Serial.println();
    delay(200); //You can use a delay to save power. The ADS1118 will be in power down state during all the delay time. Optional
    
}

void readTC(double diff_volt_mV, double cold_junc_C){
  double hot_junc_C;
  int32_t return_val;
  
  return_val = ReclaimerLabs_Thermocouple::calc_temp(TYPE_K, diff_volt_mV, cold_junc_C, &hot_junc_C);
  Serial.print(hot_junc_C);
  Serial.print(",");
}

/*
              Table 1. Noise in μVRMS (μVPP) at VDD = 3.3 V   [1]
                DATA RATE FSR (Full-Scale Range)
  (SPS) ±6.144 V        ±4.096 V     ±2.048 V       ±1.024 V        ±0.512 V        ±0.256 V
  8     187.5 (187.5)   125 (125)    62.5 (62.5)    31.25 (31.25)   15.62 (15.62)   7.81 (7.81)
  16    187.5 (187.5)   125 (125)    62.5 (62.5)    31.25 (31.25)   15.62 (15.62)   7.81 (7.81)
  32    187.5 (187.5)   125 (125)    62.5 (62.5)    31.25 (31.25)   15.62 (15.62)   7.81 (7.81)
  64    187.5 (187.5)   125 (125)    62.5 (62.5)    31.25 (31.25)   15.62 (15.62)   7.81 (7.81)
  128   187.5 (187.5)   125 (125)    62.5 (62.5)    31.25 (31.25)   15.62 (15.62)   7.81 (12.35)
  250   187.5 (252.09)  125 (148.28) 62.5 (84.03)   31.25 (39.54)   15.62 (16.06)   7.81 (18.53)
  475   187.5 (266.92)  125 (227.38) 62.5 (79.08)   31.25 (56.84)   15.62 (32.13)   7.81 (25.95)
  860   187.5 (430.06)  125 (266.93) 62.5 (118.63)  31.25 (64.26)   15.62 (40.78)   7.81 (35.83)

  
      Table 2. ENOB from RMS Noise (Noise-Free Bits from Peak-to-Peak Noise) at VDD = 3.3 V
                DATA RATE FSR (Full-Scale Range)
  (SPS)   ±6.144 V    ±4.096 V   ±2.048 V     ±1.024 V    ±0.512 V    ±0.256 V
  8       16 (16)     16 (16)    16 (16)      16 (16)     16 (16)     16 (16)
  16      16 (16)     16 (16)    16 (16)      16 (16)     16 (16)     16 (16)
  32      16 (16)     16 (16)    16 (16)      16 (16)     16 (16)     16 (16)
  64      16 (16)     16 (16)    16 (16)      16 (16)     16 (16)     16 (16)
  128     16 (16)     16 (16)    16 (16)      16 (16)     16 (16)     16 (15.33)
  250     16 (15.57)  16 (15.75) 16 (15.57)   16 (15.66)  16 (15.96)  16 (14.75)
  475     16 (15.49)  16 (15.13) 16 (15.66)   16 (15.13)  16 (14.95)  16 (14.26)
  860     16 (14.8)   16 (14.9)  16 (15.07)   16 (14.95)  16 (14.61)  16 (13.8)
  
  
  [1] Texas Instruments, "ADS1118 Ultrasmall, Low-Power, SPI™-Compatible, 16-Bit Analog-to-Digital 
  Converter with Internal Reference and Temperature Sensor", ADS1118 datasheet, SBAS457E [OCTOBER 2010–REVISED OCTOBER 2015]. 
  
  Note: This information is taken from http://www.ti.com
        Copyright © 2010–2015, Texas Instruments Incorporated
*/    
