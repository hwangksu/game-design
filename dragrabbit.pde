PImage imgground;
PImage img0, img1,img2,img3,img4;
int x,y;
int x1,y1;
void setup(){
  size(1160, 770);
  frameRate(10);
  noFill();
  imgground = loadImage("ground.jpg");
  img0 = loadImage("rabbit00.gif");
  img1 = loadImage("rabbit01.gif");
  img2 = loadImage("rabbit02.gif");
  img3 = loadImage("rabbit03.gif");
  img4 = loadImage("rabbit04.gif");
x=700;
y=600;
x1=700;
y1=300;
}
int i;
void draw(){
//  x=x-3;
//  y=y-3;
//  if(x<200 || y<200){
//   x=x+3;
//   y=y+3;
//  }
  i++;
  background(imgground);
  if(i==0)
 image(img0,x,y,250,120);
  if(i==1)
 image(img1,x,y,250,120);
  if(i==2)
 image(img2,x,y,250,120);
  if(i==3)
 image(img3,x,y,250,120);
  if(i==4){
 image(img4,x,y,250,120);
 i=0;
  }
 stroke(255); //
 fill(0);
 ellipse(x1+50, y1+50, 100, 100);
 ellipse(x1+30, y1+30, 20, 20);
 ellipse(x1+70, y1+30, 20, 20);
 arc(x1+50, y1+50, 80, 30,0.6,2.28);
 triangle(x1+40,y1+ 60, x1+60, y1+60, x1+50, y1);
}
void mouseMoved() {
    x = mouseX;
    y = mouseY;
}