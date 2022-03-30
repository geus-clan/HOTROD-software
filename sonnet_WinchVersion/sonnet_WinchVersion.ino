
/*
 *to do: local averages in calculateDeltas.
 * 

add motor enable boolean to tft

clean up readProbe and readWinch

*/


#define WINCH_DIRECTION A3
#define WINCH_ENABLE A0
#define WINCH_SPEED A5

#define PIXEL_ADDRESS 2
#define NUM_PIXELS 8

//indicator LED grid

#define STABILITY_CLASSIFIER_LED 0
#define T1_LED 1
#define T2_LED 2
#define INTT1_LED 4
#define INTT2_LED 3
#define LOAD_LED1 7
#define LOAD_LED2 8
#define LOAD_LED3 9

#define WINCH_LED 6


#define PID_OUTPUT 4

#define DELTA_SIZE 256

#define serialUSB Serial
#define serialTFT Serial1
#define serialWinch Serial2
#define serialProbe Serial3

#include <Adafruit_NeoPixel.h>
Adafruit_NeoPixel pixels(NUM_PIXELS, PIXEL_ADDRESS, NEO_GRB + NEO_KHZ800);

int rawValue;
int oldValue;

int winchSpeed = 0;        // value read from the pot
float mapSpeed = 0.0;        // value output to the PWM
float speedDebounce;

String probeString;

String winchCommand;
String lastWinchCommand;
bool winchDir;
bool winchEnable;

unsigned long time_updateWinch = 0;
unsigned long time_idle = 30;
unsigned long millis_idle = 0;

int idleWheel = 0;
const uint8_t idleDelay = 30;

/// serial reading:
const byte numChars = 128;
char receivedChars[numChars];
char tempChars[numChars];        // temporary array for use when parsing
char receivedCharsWinch[numChars];
char tempCharsWinch[numChars]; 

boolean newData = false;
boolean newDataWinch = false;                        


/// probe serial read:

float i,j,k,real,linx,liny,linz,lintotal,stabilityClassifier,intT1,intT2,T1,T2;

// probe calculatoins:

float roll, pitch, yaw;

// winch serial read:

float winchDEPLOYED,winchMPH,winchLOAD,winchMOTOR = 999.9;

//deltas

float loads[DELTA_SIZE], rolls[DELTA_SIZE];
int indxP = 0;
int indxL = 0;


void setup() 
{
  pinMode(WINCH_SPEED, INPUT); //INPUT_ANALOG);
  pinMode(WINCH_DIRECTION, INPUT_PULLUP);
  pinMode(WINCH_ENABLE, INPUT_PULLUP);

    pixels.begin(); //initialize all leds
    pixels.setBrightness(10);

    pixels.show();

  
  serialUSB.begin(9600); //USB
  serialTFT.begin(9600); //collected data to TFT vizualization
  serialWinch.begin(9600); //winch
  serialProbe.begin(9600);


  for (int i=0;i<DELTA_SIZE;i++){
    loads[i] = NULL;
  }
  
}

void loop() 
{
  //readProbe();
  readWinch();
  
//to do: build string in its own thing. look for flags when serial data is received (probe OR winch).
//change the 70 back to 50. the 70 is there because the winch throws data every 70ms.
 if(millis() >= time_updateWinch + 70){ //50mS interval on reading winch to avoid explosion of serial messages inbetween values
  time_updateWinch += 70;
  updateWinch();
  buildString_WinchOnly();
 }
 
 updateIndicators();
  
 //analogWrite(PID_OUTPUT,generatePWM());
}


///////////////////////////////////////////////////WINCH SERIAL READING

void readWinch() { //deployed,mph,load,motor
    static boolean recvInProgress = false;
    static byte ndx = 0;
    char startMarker = '<';
    char endMarker = '>';
    char rc;

    

    while (serialWinch.available() > 0 && newDataWinch == false) {
        rc = serialWinch.read();
        //serialUSB.write(rc);
        if(rc == endMarker){  //?
        }

        if (recvInProgress == true) {
            if (rc != endMarker) {
                receivedCharsWinch[ndx] = rc;
                ndx++;
                if (ndx >= numChars) {
                    ndx = numChars - 1;
                }
            }
            else {
                receivedCharsWinch[ndx] = '\0'; // terminate the string
                recvInProgress = false;
                ndx = 0;
                newDataWinch = true;
            }
        }

        else if (rc == startMarker) {
            recvInProgress = true;
        }
    }
    
    if (newDataWinch == true) {
        strcpy(tempCharsWinch, receivedCharsWinch);
            // this temporary copy is necessary to protect the original data
            //   because strtok() used in parseData() replaces the commas with \0
        parseWinchData();
        newDataWinch = false;
    }
}


void recSerial() {
    static boolean recvInProgress = false;
    static byte ndx = 0;
    char startMarker = '<';
    char endMarker = '>';
    char rc;
    

    while (serialProbe.available() > 0 && newData == false) {
        rc = serialProbe.read();
        serialUSB.write(rc);

        if(rc == endMarker){
        }

        if (recvInProgress == true) {
            if (rc != endMarker) {
                receivedChars[ndx] = rc;
                ndx++;
                if (ndx >= numChars) {
                    ndx = numChars - 1;
                }
            }
            else {
                receivedChars[ndx] = '\0'; // terminate the string
                recvInProgress = false;
                ndx = 0;
                newData = true;
                //Serial.println(" received");
            }
        }

        else if (rc == startMarker) {
            recvInProgress = true;
        }
    }
    
}

void parseWinchData() {      // split the data into its parts
    
    char * strtokIndx; // this is used by strtok() as an index

    strtokIndx = strtok(tempCharsWinch,",");
    winchDEPLOYED = atof(strtokIndx);
 
    strtokIndx = strtok(NULL, ","); // this continues where the previous call left off
    winchMPH = atof(strtokIndx);

    strtokIndx = strtok(NULL, ",");
    winchLOAD = atof(strtokIndx);
    
    strtokIndx = strtok(NULL, ",");
    winchMOTOR = atof(strtokIndx);

    fillLoadDeltas();
    float deltas10 = calculateProbeDeltas(10);
           if (deltas10 != NULL ){
           Serial.println(deltas10);
           }
           else {
           Serial.println("waiting for 10...");
           }

}


//////////////////////////////////////////////////////PROBE SERIAL READING


void readProbe() {
    recSerial();
    
    if (newData == true) {
         //serialUSB.print("r ");
         //serialUSB.println(receivedChars);
        strcpy(tempChars, receivedChars);
            // this temporary copy is necessary to protect the original data
            //   because strtok() used in parseData() replaces the commas with \0
        parseProbeData();
        getEuler();
        //fillProbeDeltas();
        newData = false;

           //float deltas10 = calculateProbeDeltas(10);
           //if (deltas10 != NULL ){
           //Serial.println(deltas10);
           //}
           //else {
            //Serial.println("waiting for 10...");
           //}
           
           /*
           float deltas100 = calculateProbeDeltas(100);
           if (deltas100 != NULL ){
           Serial.println(deltas100);
           }
           else {
           Serial.println("waiting for 100...");
           }
           */
    }
    

}


void parseProbeData() {      // split the data into its parts

  //format from PAINTRE (may 21st 2020):
  //i,j,k,real,linx,liny,linz,lintotal,stabilityclassifier,intT1,intT2,T1,T2,
  
    char * strtokIndx; // this is used by strtok() as an index
    //serialUSB.print("tempChars: \n");
    //serialUSB.println(tempChars);

    strtokIndx = strtok(tempChars,",");
    i = atof(strtokIndx);

    strtokIndx = strtok(NULL, ","); // this continues where the previous call left off
    j = atof(strtokIndx);
    
    strtokIndx = strtok(NULL, ",");
    k = atof(strtokIndx);

    strtokIndx = strtok(NULL, ",");
    real = atof(strtokIndx);

    
    strtokIndx = strtok(NULL, ",");
    linx = atof(strtokIndx);

    strtokIndx = strtok(NULL, ",");
    liny = atof(strtokIndx);
    
    strtokIndx = strtok(NULL, ",");
    linz = atof(strtokIndx);

    strtokIndx = strtok(NULL, ",");
    lintotal = atof(strtokIndx);


    strtokIndx = strtok(NULL, ",");
    stabilityClassifier = atof(strtokIndx);
       
    strtokIndx = strtok(NULL, ",");
    intT1 = atof(strtokIndx);

    strtokIndx = strtok(NULL, ",");
    intT2 = atof(strtokIndx);
    
    strtokIndx = strtok(NULL, ",");
    T1 = atof(strtokIndx);

    strtokIndx = strtok(NULL, ",");
    T2 = atof(strtokIndx);

    
}




void getEuler(){ //convert the BNO080's native Quaternion system into intuitive euler angles (pitch, roll, yaw)

  float dqw = real;
  float dqx = i;
  float dqy = j;
  float dqz = k;

  float norm = sqrt(dqw*dqw + dqx*dqx + dqy*dqy + dqz*dqz);
  dqw = dqw/norm;
  dqx = dqx/norm;
  dqy = dqy/norm;
  dqz = dqz/norm;

  float ysqr = dqy * dqy;

  // roll (x-axis rotation)
  float t0 = +2.0 * (dqw * dqx + dqy * dqz);
  float t1 = +1.0 - 2.0 * (dqx * dqx + ysqr);
  roll = atan2(t0, t1) * 180.0 / PI;;
  
  // pitch (y-axis rotation)
  float t2 = +2.0 * (dqw * dqy - dqz * dqx);
  t2 = t2 > 1.0 ? 1.0 : t2;
  t2 = t2 < -1.0 ? -1.0 : t2;
  pitch = asin(t2) * 180.0 / PI;;
  
  // yaw (z-axis rotation)
  float t3 = +2.0 * (dqw * dqz + dqx * dqy);
  float t4 = +1.0 - 2.0 * (ysqr + dqz * dqz);
  yaw = atan2(t3, t4) * 180.0 / PI;;
  
  /*
  Serial.print("r p y = ");
  Serial.print(roll);
  Serial.print("\t");
  Serial.print(pitch);
  Serial.print("\t");
  Serial.print(yaw);
  Serial.println();
  */
}

uint8_t generatePWM(){//default (0V on PID input) is no power output. Non-zero values mean generate voltage, e.g. output is inversely proportional to temp.
  const int minbounds = -10;
  const int maxbounds = 99;
                            //example: (t1 = 55. T2 = 57.) minbounds = -10, maxbounds = 99. max 
                            //map function: (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
                            //((57+55)/2 - -10) * (0 - 255) / (99 - -10) + 255) = 100.59
                            //as such, t1=0, output = 234. closer you get to minbounds (-10), the higher the output is.


  if(T1< 1999){//do not use data if t1 is an error value (2000.0).
    if(T2<1999){
      return (map((T1+T2)/2,minbounds, maxbounds, 255,0)); //if both temp measurements are not 2000, then map the average from min to max bounds.
    }
    return (map(T1,minbounds, maxbounds, 255,0)); //if only t1 valid
  }
  else if(T2<1999){
    return (map(T2,minbounds, maxbounds, 255,0)); //if only t2 valid
  }

  return NULL; //todo: test what happens when analogWriting a null value.
}

///////////////////////////////////////////////////////////BUILDING TFT STRING

void buildString(){  //called when there is new data from probe (if winch updates in the meantime, updated info will show on next probe read).
      float gData[20] = {T1,T2,stabilityClassifier,intT1,intT2,roll,pitch,yaw,winchDEPLOYED,winchMPH,winchLOAD};
      serialTFT.print("<");
      //serialUSB.print("<");
      for(int i=0;i<10;i++){
      serialTFT.print(gData[i]);
      serialTFT.print(",");
      
      //serialUSB.print(gData[i]);
      //serialUSB.print(",");
      }
      serialTFT.print(">");
      serialTFT.println();
      //serialUSB.print(">");
      //serialUSB.println();
}

void buildString_WinchOnly(){  //called when there is new data from probe (if winch updates in the meantime, updated info will show on next probe read).
      float gData[3] = {winchDEPLOYED,winchMPH,winchLOAD};
      serialTFT.print("<");
      //serialUSB.print("<");
      for(int i=0;i<3;i++){
      serialTFT.print(gData[i]);
      serialTFT.print(",");
      
      //serialUSB.print(gData[i]);
      //serialUSB.print(",");
      }
      serialTFT.print(">");
      serialTFT.println();
      //serialUSB.print(">");
      //serialUSB.println();
}

///////////////////////////////////////////////////////////WINCH HARDWARE CONTROLS

void updateWinch(){
  if (digitalRead(WINCH_ENABLE)==LOW){ //enabled (pullup resistors)
        mapSpeed = debounceAnalog();
        if (mapSpeed != NULL){ //if value has changed since last reading
        //serialUSBprintln(mapSpeed); 
        if(mapSpeed<0.1){mapSpeed=0.0;}
        winchEnabled();   
        winchCommand = "<MPH,"; //start building the winch speed command

        if (digitalRead(WINCH_DIRECTION)==LOW){  //if direction switch is down
          winchCommand += "-"; //add a minus to indicate direction
        }           
        
        winchCommand += mapSpeed; //add result to String
        winchCommand.remove(winchCommand.length()-1); //remove last decimal point
        winchCommand += ">"; //terminate the winch command

        if (!(winchCommand==lastWinchCommand)){ //if the String command has changed since the last reading, (or if the switch has flipped - i dont know why this doesn't count) continue. (comparing floats is a bad idea.)

        //send the command through the serial port
        serialUSB.println(winchCommand);
        serialWinch.println(winchCommand);
        serialUSB.println("updated");
        lastWinchCommand = winchCommand; //store the command for later comparison

        writeLEDs(WINCH_LED, analogRead(WINCH_SPEED)/4);
        }
        
        }
    }
 else{
    winchDisabled(); //send the disable command only if the winch was previously enabled  
 }
}

void winchEnabled(){ //avoid sending the enable command every time the speed is updated
  if (winchEnable == false){ //if the winch is currently not enabled, then send the command.
      serialUSB.println("<Enable,T>"); //enable
      serialWinch.println("<Enable,T>"); //enable
      winchEnable = true;
  }
}


void winchDisabled(){
  if (winchEnable == true){ //if the winch is currently not enabled, then send the command.
      serialUSB.println("<Enable,F>"); //disable
      serialWinch.println("<Enable,F>"); //disable
      winchEnable = false;
      pixels.setPixelColor(WINCH_LED, pixels.Color(0,0,0));
      pixels.show();

  }
}


float mapfloat(long x, long in_min, long in_max, long out_min, long out_max)
{
 return (float)(x - in_min) * (out_max - out_min) / (float)(in_max - in_min) + out_min;
}

float debounceAnalog(){
  rawValue = analogRead(WINCH_SPEED);
  rawValue = analogRead(WINCH_SPEED); //double read
  rawValue = constrain(rawValue, 8, 1015);
  rawValue = map(rawValue, 8, 1015, 1, 150); //changed from 120 (30.0 * 4)
  if (rawValue < (oldValue - 1) || rawValue > (oldValue + 1)) { //remove jitter
    oldValue = rawValue;
    //if(rawValue<3){return 0.1;} //eliminate glitch where min value is 0.5
    //return (0.5*round(2.0*(rawValue/4.0))); //round to the nearest .5
    //return (rawValue*4.0)+0.5)/4.0); //round to .25
    return rawValue/10.0;
    }
  else {
    return NULL;
  }
}

 void fillLoadDeltas(){
   loads[indxL] = winchLOAD;  //fill array with load cell values
   indxL++;
   if (indxL > DELTA_SIZE-1){
      indxL = 0;
   }
 }

 void fillProbeDeltas(){
   rolls[indxP] = roll;
   indxP++;
   if (indxP > DELTA_SIZE-1){
    for(int i=0;i<indxP;i++){ 
    }
      indxP = 0;
   }
 }

 float calculateLoadDeltas(int steps){ //should be used primarily for load cell, but also for orientation

  //change in last 10:
  //considering latest reading in the index, subtract 10 and compare
  //change in last 100:
  //considering latest reading in the index, subtract 100 and compare
  
  //TO DO: rolling averages
  
    if (indxL-steps<0){
        return loads[DELTA_SIZE-(indxL-steps)]-winchLOAD; //fx. if its at position 7, and you ask it to return 10, it returns (size) -3.
     }
    else {
        return loads[indxL-steps]-winchLOAD; //current value is subtracted from historical.
      }
 }

 
 float calculateProbeDeltas(int steps){ //should be used primarily for load cell, but also for orientation

  if (indxP-steps<0){
      return rolls[DELTA_SIZE-(indxP-steps)]-roll; //fx. if its at position 7, and you ask it to return 10, it returns (size) -3.
  }
  else {
      return rolls[indxP-steps]-roll; //current value is subtracted from historical.
    }
  }


/////////////////////////////////////////////////////////////////////////////////////////////////////led functions

void updateIndicators(){
  //t1
  //-sets of 10 degrees, fade up?
  //e.g. 10 to 20 degrees is blue, 20 to 30 is blue-green, 30 to 40 is green, etc.
  //can use Wheel(0-255) to select a color. would be nice to jump every 10 degree increment, then fade.
  //f.x. -10 to 150.
  //blue-green-yellow-orange-red
  //approx 30 degrees per color, so three steps within each.
/*
  for(int i=0;i<NUM_PIXELS+1;i++){ //test all pixels
    pixels.setPixelColor(i, pixels.Color(0,0,255));
    pixels.show();
    Serial.println(i);
    delay(1000);
    pixels.setPixelColor(i, pixels.Color(0,0,0));
    pixels.show();
  }
  */


  setTempIndicators(T1_LED, T1);
  setTempIndicators(T2_LED, T2);
  setTempIndicators(INTT1_LED, intT1);
  setTempIndicators(INTT2_LED, intT2);


  //load

  //tilt OL
  

  ///stability status

  
if (stabilityClassifier > 4) { //comparing floats is a bad idea
     pixels.setPixelColor(STABILITY_CLASSIFIER_LED, pixels.Color(255,0,0)); //MOVING
 }
 else if (stabilityClassifier > 3){
     pixels.setPixelColor(STABILITY_CLASSIFIER_LED, pixels.Color(255,0,255)); //STABLE
 }
 else if (stabilityClassifier > 2){
     pixels.setPixelColor(STABILITY_CLASSIFIER_LED, pixels.Color(0,0,255)); //STOPPED
 }
 else if (stabilityClassifier > 1){
     pixels.setPixelColor(STABILITY_CLASSIFIER_LED, pixels.Color(50,50,50)); //AT REST
 }
 else {
     pixels.setPixelColor(STABILITY_CLASSIFIER_LED, pixels.Color(0,0,0)); //ERROR
 }

   pixels.show();
}

void setTempIndicators(int pin, int value){
  
  const int minTemp = -10;
  const int maxTemp = 150;
  
  if(value>1999){
  pixels.setPixelColor(pin, pixels.Color(0,0,0)); //error
  }
  else if (value>maxTemp){
  pixels.setPixelColor(pin, pixels.Color(255,255,255)); //ultra hot = white
  }
  else if (value<minTemp){
  pixels.setPixelColor(pin, pixels.Color(0,0,70)); //ultra cold = dark blue
  }
  else{
  pixels.setPixelColor(pin, Wheel(map(value,minTemp,maxTemp,230,0))); //wheel turns from blue back to red, try and find start of blue (should be around 230?)
  }
}

void writeLEDs(uint8_t address, uint8_t value){
  //leds GRB, up to 255, lower values means dimmer.
  pixels.setPixelColor(address, Wheel(value/3));
  pixels.show();
}

void idle(){
   
    if(millis() >= time_idle + idleDelay){
        time_idle += idleDelay;
        idleWheel++;
        if(idleWheel > 150){
          idleWheel = 0;
        }
        for(i=0; i<NUM_PIXELS; i++) {
      pixels.setPixelColor(i, Wheel2(idleWheel));
    }
          pixels.show();
    }
    
}

    // Input a value 0 to 255 to get a color value.
    // The colours are a transition r - g - b - back to r.
uint32_t Wheel(byte WheelPos){
  WheelPos = 255 - WheelPos;
  if(WheelPos < 85)
  {
      return pixels.Color(255 - WheelPos * 3, 0, WheelPos * 3);
  }
  else if(WheelPos < 170)
  {
      WheelPos -= 85;
      return pixels.Color(0, WheelPos * 3, 255 - WheelPos * 3);
  }
  else
  {
      WheelPos -= 170;
      return pixels.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
  }
}
        

uint32_t Wheel2(byte WheelPos) {
  WheelPos = 255 - WheelPos;
  if(WheelPos < 85) {
    return pixels.Color(255 - WheelPos * 3, 50, WheelPos * 3);
  }
  if(WheelPos < 170) {
    WheelPos -= 85;
    return pixels.Color( WheelPos * 3,50, 255 - WheelPos * 3);
  }
  WheelPos -= 170;
  return pixels.Color(255 - WheelPos * 3,50, WheelPos * 3);
}
