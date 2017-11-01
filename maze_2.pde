int x,y;
int success;

//int[] barier=new int [4*5];
int[] barier={180,0,20,240,220,0,20,100,220,120,20,180,
  0,300,240,20,260,300,580,20,
  0,340,390,20,410,340,390,20,
  0,380,290,20,310,380,490,20,
  0,420,490,20,510,420,290,20
};
int starts, ends; // Values from 0 - 59
int startmi, endmi; // Values from 0 - 59
int first=1;

void setup() {
  size(800, 600); 
  x=400;
  y=580; 
  success=0;
}

void draw() {
  background(0);
  fill(100);
  ellipse(100,100,30,30);
  fill(180);
  for(int i=0; i<11; i++){
    rect(barier[i*4],barier[i*4+1],barier[i*4+2],barier[i*4+3]);
  }
  fill(255);
  rect(x,y,20,20);
  int d = day(); // Values from 1 - 31
  int mo = month(); // Values from 1 - 12
  int y = year(); // 2003, 2004, 2005, etc.
  int s = second(); // Values from 0 - 59
  int mi = minute(); // Values from 0 - 59
  int h = hour(); // Values from 0 - 23
  
  String st = String.valueOf(y);
  textSize(14);
  text(st, 10, 28);
  st = String.valueOf(mo);
  text(st, 50, 28); 
  st = String.valueOf(d);
  text(st, 70, 28);
  st = String.valueOf(h);
  text(st, 90, 28);
  st = String.valueOf(mi);
  text(st, 110, 28); 
  st = String.valueOf(s);
  text(st, 130, 28);
  
  if(success==1){
    st="SUCCESS";
    textSize(140);
    text(st, 230, 328);
    st = String.valueOf(endmi);
    text(st, 230, 478);
    st = String.valueOf(ends);
    text(st, 350, 478);
  }
}

int prex,prey;
void keyPressed(){
  if(first==1){
    starts = second(); // Values from 0 - 59
    startmi = minute(); // Values from 0 - 59
    first=0;
  }
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
  // if(x<800 && x>0 && y<320 && y>300){
  // x=prex;
  // y=prey;
  // }
  for(int i=0; i<11; i++){
  //rect(barier[i*4],barier[i*4+1],barier[i*4+2],barier[i*4+3]);
    if(x<(barier[i*4]+barier[i*4+2] )&& x>(barier[i*4]-19) && y<(barier[i*4+1]+barier[i*4+3]) && y>(barier[i*4+1]-19)){
      x=prex;
      y=prey;
    }
  }
  if(x>85 && x<115 && y>85 && y<115 ){
    success=1;
    ends= second()-starts;
    endmi= minute()-startmi;
  }
}
