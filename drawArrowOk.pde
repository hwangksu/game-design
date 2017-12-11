int x,y;
float ang;
int inm2;
String ssm="50";

void setup(){
  size(800,800);
}

void draw(){
  inm2=Integer.parseInt(ssm);
  background(105);
  strokeWeight(12);
  ang=map(inm2,0,50,180,360);
  drawArrow(400,400,100,ang);

  strokeWeight(2);
  stroke(0,0,255);
  drawArrow(400,400,120,180);
  stroke(255,0,0);
  drawArrow(400,400,120,210);
  stroke(0,255,0);
  drawArrow(400,400,120,230);
  stroke(0,0,255);
  drawArrow(400,400,120,250);
  stroke(255,0,255);
  drawArrow(400,400,120,270);
  stroke(255,0,255);
  drawArrow(400,400,120,300);
  stroke(255,0,255);
  drawArrow(400,400,120,330);
  stroke(255,0,255);
  drawArrow(400,400,120,360);
  stroke(10);
textSize(30);
textAlign(CENTER);
for (int i=0; i<=50; i=i+10){ 
ang=map(i,0,50,3*PI/2,PI/2);
y=int(150*cos(ang))+400;
x=int(150*sin(ang))+400;
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