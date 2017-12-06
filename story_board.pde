PImage imgground;
PImage img0, img1,img2,img3,img4;
PImage img10,img11,img12;
PImage img20,img21,img22;
PImage img30,img31,img32;
int x,y;
int x1,y1;
int x2,y2;
int x3,y3;
void setup(){
size(1160, 770);
frameRate(10);
imgground = loadImage("ground.jpg");
img0 = loadImage("rabbit00.gif");
img1 = loadImage("rabbit01.gif");
img2 = loadImage("rabbit02.gif");
img3 = loadImage("rabbit03.gif");
img4 = loadImage("rabbit04.gif");
img10 = loadImage("bird1.png");
img11 = loadImage("bird2.png");
img12 = loadImage("bird3.png");
img20 = loadImage("1.png");
img21 = loadImage("2.png");
img22 = loadImage("0.png");
img30 = loadImage("king1.png");
img31 = loadImage("king2.png");
x=700;
y=600;
x1=700;
y1=300;
}
int mov5;
int mov3;
int mov2;
void draw(){
// background(255);
image(imgground,0,0, 1160, 770);
mov5++;
if(mov5==1){
image(img0,x,y,250,120);
} else if(mov5==2){
image(img1,x,y,250,120);
} else if(mov5==3){
image(img2,x,y,250,120);

} else if(mov5==4){
image(img3,x,y,250,120);

} else if(mov5==5){
image(img4,x,y,250,120);
mov5=0;
} 
mov3++;
if(mov3==1){
image(img10,x1,y1,80,50);
image(img20,x2,y2,180,120);
} else if(mov3==2){
image(img11,x1,y1,80,50);
image(img21,x2,y2,180,120);
} else if(mov3==3){
image(img12,x1,y1,80,50);
image(img22,x2,y2,180,120);
mov3=0;
}
mov2++;
if(mov2==1){
image(img30,x3,y3,80,120);
} else if(mov2==2){
image(img31,x3,y3,80,120);
mov2=0;
}

}
void mouseMoved() {
if(key=='r'){ //兔子 
x = mouseX;
y = mouseY;
}else if(key=='b'){ //小 
x1 = mouseX;
y1 = mouseY;
}else if(key=='u'){ //小 
x2 = mouseX;
y2 = mouseY;
}else if(key=='k'){ //小 
x3 = mouseX;
y3 = mouseY;
}
}