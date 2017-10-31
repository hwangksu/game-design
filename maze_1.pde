int x,y;

void setup() {
  size(800, 600); 
  x=400;
  y=580; 
  textSize(26);
}

void draw() {
background(0);
int d = day();    // Values from 1 - 31
int mo = month();  // Values from 1 - 12
int y = year();   // 2003, 2004, 2005, etc.
int s = second();  // Values from 0 - 59
int mi = minute();  // Values from 0 - 59
int h = hour();    // Values from 0 - 23

String st = String.valueOf(y);
text(st, 10, 28);
st = String.valueOf(mo);
text(st, 80, 28); 
st = String.valueOf(d);
text(st, 120, 28);
st = String.valueOf(h);
text(st, 160, 28);
st = String.valueOf(mi);
text(st, 200, 28); 
st = String.valueOf(s);
text(st, 240, 28);
//rect(x,y,20,20);
//ellipse(x, y, 20, 20);
ellipse(x+10, y+10, 20, 20);
fill(180);
rect(0,300,800,20);
rect(0,340,390,20);
rect(410,340,390,20);
rect(0,380,290,20);
rect(310,380,490,20);
rect(0,420,490,20);
rect(510,420,290,20);
fill(255);

}
int prex,prey;
void keyPressed(){
  prex=x;
  prey=y;
  if(key=='a'){
    x=x-5;
  }
  if(key=='d'){
    x=x+5;
  }
  if(key=='z'){
    y=y+5;
  }
  if(key=='w'){
    y=y-5;
  }
 if(x<800 && x>0 && y<320 && y>300){
    x=prex;
    y=prey;
  }
//if(x<390 && x>0 && y<360 && y>340){
 if(x<390 && x>0 && y<360 && y>321){
    x=prex;
    y=prey;
}
//if(x<800 && x>410 && y<360 && y>340){
//  if(x<800 && x>391 && y<360 && y>340){
 if(x<800 && x>391 && y<360 && y>321){
    x=prex;
    y=prey;
}
 if(x<290 && x>0 && y<400 && y>361){
    x=prex;
    y=prey;
  }
 if(x<800 && x>291 && y<400 && y>361){
    x=prex;
    y=prey;
  }
 if(x<490 && x>0 && y<440 && y>401){
    x=prex;
    y=prey;
  }
 if(x<800 && x>491 && y<440 && y>401){
    x=prex;
    y=prey;
  }
}

