// 指針式
int x,y;
float ang;
int im2;
String m2="30";
// im2=Integer.parseInt(m2);
im2=int(m2);

void setup(){
size(800,800);
}

void draw(){
//background(0);
ang=map(im2,0,50,3*PI/2,PI/2);
//y=int(100*cos(ang))+400;
//x=int(100*sin(ang))+400;
// rectMode(CORNERS);
//ellipse(400,400,10,10);
//line(400,400,x,y);
drawArrow(400,400,100,ang);
stroke(0);
textSize(30);
textAlign(CENTER);
for (int i=0; i<=50; i=i+10){ 
ang=map(i,0,50,3*PI/2,PI/2);
y=int(100*cos(ang))+400;
x=int(100*sin(ang))+400;
text(i,x,y);
}
}

void drawArrow(int cx, int cy, int len, float angle){
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angle));
  line(0,0,len, 0);
  line(len, 0, len - 8, -8);
  line(len, 0, len - 8, 8);
  popMatrix();
}