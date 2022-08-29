#include <Adafruit_HX8357.h>
#include <SPI.h>
#include <Adafruit_GFX.h>



#ifdef ARDUINO_STM32_FEATHER
   #define TFT_DC   PB4
   #define TFT_CS   PA15
   #define STMPE_CS PC7
   #define SD_CS    PC5
#endif
#define TFT_RST -1
String readString1;
String winchString;
int winchCursor = 120;

const byte numChars = 128;
char receivedChars[numChars];
char tempChars[numChars];        // temporary array for use when parsing
char receivedCharsWinch[numChars];

boolean newData = false;
boolean newDataWinch = false;


boolean setAccelScreen = false;

int cursorY = 140;

/// SONNET serial read:
float winchDEPLOYED,winchMPH,winchLOAD,winchMOTOR,winchSPEED,winchDIRECTION,winchON = 9999.9;
bool oldDirection, oldEnable;
float oldSpeed,oldDepth,oldMPH,oldLoad;
#include <Fonts/FreeSans9pt7b.h>

Adafruit_HX8357 tft = Adafruit_HX8357(TFT_CS, TFT_DC, TFT_RST);

void setup() {
  Serial.begin(9600); //used for winch (and serial monitor USB).
  Serial1.begin(9600); //used for probe
  tft.begin();
  tft.setRotation(3);



   while (!Serial1)
  {delay(1);}

 tft.setFont(&FreeSans9pt7b);
   
 //tft.fillScreen(0x12345);
   tft.fillScreen(HX8357_BLACK);

 //set up labels

 tft.drawLine(25, 130, tft.width()-25, 130, HX8357_WHITE); //from, to, color
 //tft.drawLine(25, 170, tft.width()-25, 170, HX8357_WHITE); //from, to, color

 tft.setTextColor(HX8357_WHITE);

 tft.setTextSize(1);
 tft.setCursor(11, 15);
 tft.print("Controller settings:");
 int tftx = 1;
 int tfty = 40;
 tft.setCursor(tftx, tfty);
 tft.print("on:");
 tfty+=25;
 tft.setCursor(tftx, tfty);
 tft.print("speed:");
 tfty+=25;
 tft.setCursor(tftx, tfty);
 tft.print("dir:");
 /*
 //tft.setCursor(200, 15);
 //tft.print("Internal temp.");
 */
 tft.setCursor(400, 15);
 tft.print("Winch");
 tft.setTextSize(1); 
// tft.setCursor(25,155);

 //tft.print("From winch:");

 tft.setTextSize(1);
  
 tft.setCursor(340, 40);
 tft.print("Depth:");
 tft.setCursor(340, 65);
 tft.print("MPH:");
 tft.setCursor(340, 89);
 tft.print("Load:");
 /*
 tft.setCursor(5, 215);
 tft.print("Depth:");
 tft.setCursor(5, 240);
 tft.print("MPH:");
 tft.setCursor(5, 265);
 tft.print("Load:");
 */
 
  //tft.fillRect(0,0,215,24,HX8357_RED); //x,y,w,h,color
}


void loop(void){
  readSONNET();
  
  readWinch();

  
  updateTFT();
  
}

void recSerial() {
    static boolean recvInProgress = false;
    static byte ndx = 0;
    char startMarker = '<';
    char endMarker = '>';
    char rc;
    

    while (Serial1.available() > 0 && newData == false) {
        rc = Serial1.read();
        //Serial.write(rc);
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
            }
        }

        else if (rc == startMarker) {
            recvInProgress = true;
        }
    }
    
}

void recSerialWinch() {
    static boolean recvInProgress = false;
    static byte ndx = 0;
    char startMarker = '[';
    char endMarker = ']';
    char rc;
    

    while (Serial1.available() > 0 && newDataWinch == false) {
        rc = Serial1.read();
        //Serial.write(rc);
        if(rc == endMarker){
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
    
}


void readWinch() {
    recSerialWinch();
    
    if (newDataWinch == true) {
        SerialMonitor();
        newDataWinch = false;
    }
}

void readSONNET() {
    recSerial();
    
    if (newData == true) {
        strcpy(tempChars, receivedChars);
            // this temporary copy is necessary to protect the original data
            //   because strtok() used in parseData() replaces the commas with \0
        Serial.println(tempChars);
        parseSONNET();
        updateTFT();
        newData = false;
    }
}

void parseSONNET() {      // split the data into its parts

  //format from PAINTRE (July 9th 2020):
  //T1,T2,stabilityClassifier,intT1,intT2,roll,pitch,yaw,winchDEPLOYED,winchMPH,winchLOAD
    char * strtokIndx; // this is used by strtok() as an index

    strtokIndx = strtok(tempChars,",");
    /*
    T1 = atof(strtokIndx);
 
    strtokIndx = strtok(NULL, ","); // this continues where the previous call left off
    T2 = atof(strtokIndx);

    strtokIndx = strtok(NULL, ",");
    stabilityClassifier = atof(strtokIndx);

    strtokIndx = strtok(NULL, ",");
    intTC1 = atof(strtokIndx);
    
    strtokIndx = strtok(NULL, ",");
    intTC2 = atof(strtokIndx);

    strtokIndx = strtok(NULL, ",");
    roll = atof(strtokIndx);
    
    strtokIndx = strtok(NULL, ",");
    pitch = atof(strtokIndx);

    strtokIndx = strtok(NULL, ",");
    yaw = atof(strtokIndx);
*/
    winchDEPLOYED = atof(strtokIndx);
       
    strtokIndx = strtok(NULL, ",");
    winchMPH = atof(strtokIndx);

    strtokIndx = strtok(NULL, ",");
    winchLOAD = atof(strtokIndx);


    strtokIndx = strtok(NULL, ",");
    winchMOTOR = atof(strtokIndx);

    strtokIndx = strtok(NULL, ",");
    winchSPEED = atof(strtokIndx);

    strtokIndx = strtok(NULL, ",");
    winchDIRECTION = atof(strtokIndx);

    strtokIndx = strtok(NULL, ",");
    winchON = atof(strtokIndx);
}


  
 void updateTFT() {

      tft.setFont();

 tft.setTextSize(3); 

 tft.setTextColor(HX8357_WHITE);

 //tft.setCursor(63, 24);
 //tft.fillRect(63, 24, 122,24, HX8357_BLUE); //x,y,w,h,color
 
 //tft.print(winchON);

 if(abs(winchSPEED-oldSpeed) > 0.1){
  
 tft.setCursor(63, 50);
 tft.fillRect(63, 50, 122,24,HX8357_BLUE); //x,y,w,h,color
 tft.print(winchSPEED);
  oldSpeed = winchSPEED;
 }
 if (winchDIRECTION > 0.5){ //if winch direction is down
  if(!oldDirection){        //if it's set as up:
     tft.setCursor(63, 75);
     tft.fillRect(63, 75, 122,24,HX8357_BLUE); //x,y,w,h,color
     tft.print("DOWN");
     oldDirection = true;
  }
 }
 else{ //winch direction is up
  if(oldDirection){        //if it's set as down:
     tft.setCursor(63, 75);
     tft.fillRect(63, 75, 122,24,HX8357_BLUE); //x,y,w,h,color
     tft.print("UP");
     oldDirection = false;
  }
 }

 
 if (winchON > 0.5){ //enabled
  if(!oldEnable){        //if it's set as up:
     
 
     tft.fillRect(63, 24, 122,24,HX8357_WHITE); //x,y,w,h,color
     tft.setTextColor(HX8357_BLACK);
     tft.setFont(&FreeSans9pt7b);

    tft.setTextSize(1); 
    tft.setCursor(76, 40);
    tft.print("Enabled");
    
     oldEnable = true;
  }
 }
 
 else{ //winch Enable is up
  if(oldEnable){        //if it's set as down:
     

     tft.fillRect(63, 24, 122,24,HX8357_WHITE); //x,y,w,h,color
     tft.setTextColor(HX8357_BLACK);
     tft.setFont(&FreeSans9pt7b);

    tft.setTextSize(1); 
    tft.setCursor(75, 40);
    tft.print("Disabled");
     oldEnable = false;
  }
 }
  tft.setFont();

 tft.setTextColor(HX8357_BLACK);

  
  
 tft.setTextSize(3); 
      /*
 if(abs(winchDEPLOYED-oldDepth) > 0.1){
  
       tft.setCursor(401, 24);
       tft.fillRect(400, 24, 120, 35, HX8357_YELLOW); //x,y,w,h,color
       tft.print(winchDEPLOYED);
       oldDepth = winchDEPLOYED;}

if(abs(winchMPH-oldMPH) > 0.1){

       tft.setCursor(401, 50);
       tft.fillRect(400, 50, 120 ,35,HX8357_YELLOW); //x,y,w,h,color
       tft.print(winchMPH);
       oldMPH = winchMPH;
      }

if(abs(winchLOAD-oldLoad) > 0.1){

       tft.setCursor(401, 75);
       tft.fillRect(400, 75, 120,35,HX8357_YELLOW); //x,y,w,h,color
       tft.print(winchLOAD);
       oldLoad = winchLOAD;
       }
      
*/



 }

 void SerialMonitor(){

  if (cursorY > 275){
    cursorY = 140;
     tft.fillRect(1,140,500,tft.width(),HX8357_BLACK); //x,y,w,h,color
  }
  
 tft.setFont();
 tft.setTextColor(HX8357_YELLOW);

 


 tft.setTextSize(2);
 tft.setCursor(5,cursorY);
 tft.print(receivedCharsWinch);
 cursorY += 25;
 }
