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

boolean newData = false;

boolean setAccelScreen = false;

/// SONNET serial read:
float i,j,k,real,linx,liny,linz,lintotal,stabilityClassifier,intTC1,intTC2,T1,T2,winchDEPLOYED,winchMPH,winchLOAD,winchMOTOR,roll,pitch,yaw;

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
   
 tft.fillScreen(0x12345);
  
 //set up labels

 tft.drawLine(25, 130, tft.width()-25, 130, HX8357_WHITE); //from, to, color
 tft.drawLine(25, 170, tft.width()-25, 170, HX8357_WHITE); //from, to, color

 tft.setTextColor(HX8357_WHITE);

 tft.setTextSize(1);
 tft.setCursor(11, 15);
 tft.print("Orientation");
 int tftx = 1;
 int tfty = 40;
 tft.setCursor(tftx, tfty);
 tft.print("roll:");
 tfty+=25;
 tft.setCursor(tftx, tfty);
 tft.print("pitch:");
 tfty+=25;
 tft.setCursor(tftx, tfty);
 tft.print("yaw:");
 tft.setCursor(200, 15);
 tft.print("Internal temp.");
 tft.setCursor(400, 15);
 tft.print("Winch");
 tft.setTextSize(1); 
 tft.setCursor(25,155);
 tft.print("Copper temperature");

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
        Serial.write(rc);
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


void readSONNET() {
    recSerial();
    
    if (newData == true) {
        strcpy(tempChars, receivedChars);
            // this temporary copy is necessary to protect the original data
            //   because strtok() used in parseData() replaces the commas with \0
        parseSONNET();
        updateTFT();
        newData = false;
    }
}

void parseSONNET() {      // split the data into its parts

  //format from PAINTRE (July 9th 2020):
  //T1,T2,stabilityClassifier,intT1,intT2,roll,pitch,yaw,winchDEPLOYED,winchMPH,winchLOAD
    char * strtokIndx; // this is used by strtok() as an index
/*
    strtokIndx = strtok(tempChars,",");
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
    strtokIndx = strtok(NULL, ",");
    winchDEPLOYED = atof(strtokIndx);
       
    strtokIndx = strtok(NULL, ",");
    winchMPH = atof(strtokIndx);

    strtokIndx = strtok(NULL, ",");
    winchLOAD = atof(strtokIndx);
}


  
 void updateTFT() {
  /*
      tft.setFont();

 tft.setTextSize(3); 

 tft.setCursor(63, 24);
 tft.fillRect(63, 24, 122,24, HX8357_BLUE); //x,y,w,h,color
 tft.print(roll);

 tft.setCursor(63, 50);
 tft.fillRect(63, 50, 122,24,HX8357_BLUE); //x,y,w,h,color
 tft.print(pitch);
 
 tft.setCursor(63, 75);
 tft.fillRect(63, 75, 122,24,HX8357_BLUE); //x,y,w,h,color
 tft.print(yaw);

 
 tft.setCursor(207, 25);
 tft.fillRect(205, 25, 122,25,HX8357_RED); //x,y,w,h,color
 tft.print(intTC1);
 
 tft.setCursor(207, 50);
 tft.fillRect(205,50,122,25,HX8357_RED); //x,y,w,h,color
 tft.print(intTC2);

 tft.setCursor(240, 100);
 tft.fillRect(205,85,122,30,HX8357_WHITE); //x,y,w,h,color
 tft.setTextColor(HX8357_BLACK);
  tft.setFont(&FreeSans9pt7b);

 tft.setTextSize(1); 
 if (stabilityClassifier > 4) { //comparing floats is a bad idea
       tft.print("Moving");
 }
 else if (stabilityClassifier > 3){
       tft.print("Stable");
 }
 else if (stabilityClassifier > 2){
       tft.print("Stopped");
 }
 else if (stabilityClassifier > 1){
       tft.print("At rest");
 }
 else {
       tft.print("Unknown");
 }
  tft.setTextColor(HX8357_WHITE);



 tft.setCursor(200, 140);
 tft.fillRect(200, 140, 125, 25, HX8357_RED); //x,y,w,h,color
 tft.print(T1);
 
 tft.setCursor(350, 140);
 tft.fillRect(350,140,125,25,HX8357_RED); //x,y,w,h,color
 tft.print(T2);

*/
  tft.setFont();

 tft.setTextColor(HX8357_BLACK);

  
  
 tft.setTextSize(3); 
      
       tft.setCursor(401, 24);
       tft.fillRect(400, 24, 120, 35, HX8357_YELLOW); //x,y,w,h,color
       tft.print(winchDEPLOYED);
      
       tft.setCursor(401, 50);
       tft.fillRect(400, 50, 120 ,35,HX8357_YELLOW); //x,y,w,h,color
       tft.print(winchMPH);
       
       tft.setCursor(401, 75);
       tft.fillRect(400, 75, 120,35,HX8357_YELLOW); //x,y,w,h,color
       tft.print(winchLOAD);
      



 


 tft.setTextSize(2);
 tft.setCursor(5,275);
 tft.fillRect(1,275,500,45,HX8357_BLACK); //x,y,w,h,color
 tft.print(receivedChars);
 

 }
