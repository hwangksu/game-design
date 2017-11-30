/**
 * Serial Duplex 
 * by Tom Igoe. 
 * 
 * Sends a byte out the serial port when you type a key
 * listens for bytes received, and displays their value. 
 * This is just a quick application for testing serial data
 * in both directions. 
 */


import processing.serial.*;

Serial myPort;      // The serial port
int whichKey = -1;  // Variable to hold keystoke values
int inCount;    // Incoming serial data
byte inByte;
String  inStr;
int temp;
int a;
String[] m;
String[] m2;
int newStr=1;
void setup() {
  size(800, 600);
    background(0);
   PFont  myFont = createFont("標楷體",100,true);
  textFont(myFont);

  // List all the available serial ports:
  printArray(Serial.list());

  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // In Windows, this usually opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  String s = "Inside a tag, you will find <tag>content</tag>.";
 m = match(s, "<tag>(.*?)</tag>");
println("Found '" + m[1] + "' inside the tag.");
}

void draw() {
  if(newStr==0)
    background(0);
textSize(20);
  text("接收: " + inStr , 10, 230);
  text("發送: " + whichKey, 10, 100);
     if (m != null) {
       textSize(20);
       text("Humidity: "+ m[1],10,430);
     }
     if (m2 != null) {
      textSize(20);
      text("Temperature: "+ m2[1],10,330);
     }
}

void serialEvent(Serial myPort) {
  inByte = byte(myPort.read());
//  inStr += char(inByte);
//  if (inByte==0x0a || inByte==0x0d){
  if (inByte==0x0a ){
//    background(0);
//    a=inStr.indexOf("Humidity:");
//    a=inStr.indexOf("Temperature:");
//     m = match(inStr, "Humidity:(.*?)%\t Temperature");
//     m = match(inStr, "Temperature: (.*?) ");
//     m = match(inStr, "Temperature:(.*?)C");
     m = match(inStr, "Humidity: (.*?) ");
//     if (m != null) {
//       println("Found Humidity:" + m[1] );
//       textSize(20);
//       text("Humidity: "+ m[1],10,430);
//     }
     m2 = match(inStr, "Temperature: (.*?) ");
//     if (m2 != null) {
//       println("Found Temperature:" + m2[1] );
//    temp=(inStr[a]-0x30);
//      textSize(20);
//      text("Temperature: "+ m2[1],10,330);
//     }
    newStr =1;
  } else {
    if (newStr==1){
      newStr=0;
      inStr="";
    }
    inStr = inStr +char(inByte);
    println(inStr);
  }
}

void keyPressed() {
  // Send the keystroke out:
  myPort.write(key);
  whichKey = key;
}