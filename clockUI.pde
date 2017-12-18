import controlP5.*;
import processing.serial.*;

ControlP5 cp5;
String textValue = "";
String textValue1 = "";
String textValue2 = "";
String textValue3 = "";

Serial myPort;
void setup() {
size(1000,700);
String portName = Serial.list()[1];
myPort = new Serial(this, portName, 9600);

PFont font;
font = createFont("標楷體",20,true);

cp5 = new ControlP5(this); 
cp5.addTextfield("input")
.setLabel("set時") 
.setPosition(20,100)
.setSize(200,40)
.setFont(font)
.setFocus(true)
.setColor(color(255,0,0)) ;

cp5.addTextfield("input2")
.setLabel("set分") 
.setPosition(20,180)
.setSize(200,40)
.setFont(font)
.setFocus(true)
.setColor(color(255,0,0)) ;

cp5.addBang("clear")
.setLabel("set清除") 
.setPosition(240,100)
.setSize(100,80)
.setFont(font)
.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER) ; 

cp5.addBang("tr")
.setLabel("set傳送") 
.setPosition(240,200)
.setSize(100,80)
.setFont(font)
.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER) ; 

cp5.addTextfield("inputa")
.setLabel("set alarm 時") 
.setPosition(420,100)
.setSize(200,40)
.setFont(font)
.setFocus(true)
.setColor(color(255,0,0)) ;

cp5.addTextfield("inputa2")
.setLabel("set alarm分") 
.setPosition(420,180)
.setSize(200,40)
.setFont(font)
.setFocus(true)
.setColor(color(255,0,0)) ;

cp5.addBang("cleara")
.setLabel("set清除alarm") 
.setPosition(640,100)
.setSize(100,80)
.setFont(font)
.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER) ; 

cp5.addBang("tr_alm")
.setLabel("set傳送alarm") 
.setPosition(640,200)
.setSize(100,80)
.setFont(font)
.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER) ; 
}

void draw() {
background(0);
fill(255);
text(textValue=cp5.get(Textfield.class,"input").getText(), 360,130);
text(textValue, 360,180);
text(textValue1=cp5.get(Textfield.class,"input2").getText(), 360,230);
text(textValue1, 360,280);
text(textValue2=cp5.get(Textfield.class,"inputa").getText(), 760,130);
text(textValue2, 760,180);
text(textValue3=cp5.get(Textfield.class,"inputa2").getText(), 760,230);
text(textValue3, 760,280);
}

char serialOut[]={'a','b','c',':','1','2','\n'};
char serialalmOut[]={'a','l','m',':','1','2','\n'};
public void tr() {
serialOut[4]=char(int(textValue));
serialOut[5]=char(int(textValue1));
for(int i=0; i<7; i++){
myPort.write(serialOut[i]);
}
//cp5.get(Textfield.class,"input").clear();
}
public void tr_alm() {
serialalmOut[4]=char(int(textValue2));
serialalmOut[5]=char(int(textValue3));
for(int i=0; i<7; i++){
myPort.write(serialalmOut[i]);
}
//cp5.get(Textfield.class,"input").clear();
}