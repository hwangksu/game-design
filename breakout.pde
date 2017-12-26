
import processing.sound.*;

SoundFile file;

PImage block_Bg;
PImage img;
PImage imgBall;
PImage  pad;
int xPad,yPad;//球拍的x,y座標

Block block;
int xBul,yBul;//球的x,y座標
int xBulSpeed,yBulSpeed;//球速

int score;
int ball;

int[][] a={
 {4,1,1,1,1,1,4},
 {2,2,2,2,2,2,2},
 {3,3,3,3,3,3,3},
 {1,2,4,4,4,3,1},
 {3,2,1,3,2,1,3},
 {3,2,1,3,2,1,3},
 {1,2,1,3,1,2,3}
};

void disp(){
  for(int i=0; i<7; i++){
    for(int j=0; j<7; j++){
      if(a[j][i]==1){
        block.blockR(i,j);
      }else     if(a[j][i]==2){
        block.blockG(i,j);
      }else     if(a[j][i]==3){
        block.blockB(i,j);
      }else     if(a[j][i]==4 || a[j][i]==0) {
        block.blockC(i,j);
      }
    }
  }  
}

void setup(){
  size(500,800);
  block_Bg = loadImage("block_Bg.png");
  img=loadImage("img_RGB.png");
  imgBall=loadImage("ball.png");
  block=new Block(img,60,20,40,50); //圖片,磚塊長,高,邊界寬,高
  xBulSpeed=10;
  yBulSpeed=10;
  xBul=250;
  yBul=250;
  pad = loadImage("pad.png");
  xPad=250;
  yPad=700;
  file = new SoundFile(this,"glass.mp3");
ball=5;
}
int x,y;
void draw(){
  image(block_Bg,0,0,500,800);
  textSize(30);
//  stroke(255,0,0);
  fill(255,0,0);
  text("ball:"+ball,50,30);
//  stroke(255);
  fill(255);
  text("score:"+score,180,30);
  disp();  
  xBul = xBul + xBulSpeed;
  yBul = yBul + yBulSpeed;
  image(imgBall, xBul, yBul,20,20);
  if(xBul+20 > width-50){
      xBulSpeed= -1 * xBulSpeed;
      file.play();
  //偵測右邊
  }
  if(xBul<40){
        xBulSpeed= -1 * xBulSpeed;
        file.play();
  //偵測左邊
  }
  if(yBul< 50){
        yBulSpeed= -1 *yBulSpeed;
        file.play();
  //偵測右邊
  }
  if(yBul>730 ){
    xBul=250;
    yBul=250;
    ball-=1;
  //偵測下邊
  }
  for(int i=0; i<7; i++){
    for(int j=0; j<7; j++){
      if(a[j][i] >=1 && a[j][i] <= 3){
        x=40+i*60;;
        y=50+j*20;
        if (xBul-10 >= x && xBul+10 <= x+60 && yBul-10 >= y && yBul+10 <= y+20){
           yBulSpeed= -1 *yBulSpeed;
           score+=5;//得分
           a[j][i]=0;
           file.play();
        }
      }
      }
    }
    if (xBul-10 >= xPad && xBul+10 <= xPad+70 && yBul-10 >= yPad && yBul+10 < yPad+20){
          yBulSpeed= -1 *yBulSpeed;
    }    
    image(pad, xPad, yPad,70,20);
    if(ball <=0){
//      gameover();
    }
}

void keyPressed(){
  if(key=='a'){
    xPad=xPad-8;
  }
  if(key=='d'){
    xPad=xPad+8;
  }
  if(xPad+70>width-40){
      xPad=width-40-70;//防止球拍超過右邊界
  }
  if(xPad<40){
         xPad=40;//防止球拍超過左邊界
  }
}
void mouseMoved(){
  if(mouseX >= xPad+70){
    xPad=xPad+10;
  }
  if(mouseX < xPad){
    xPad=xPad-10;
  }
  if(xPad+70>width-40){
      xPad=width-40-70;//防止球拍超過右邊界
  }
  if(xPad<40){
         xPad=40;//防止球拍超過左邊界
  }
}