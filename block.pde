class Block{
  PImage img;
int w;
int h;
int w1;
int h1;
int mw1;
int mh1;


Block(PImage imgin, int wi, int hi, int mwi, int mhi){
  this.img=imgin;
  this.w1=wi;
  this.h1=hi;
  this.mw1=mwi;
  this.mh1=mhi;
}

void blockR(int x, int y){
  w=img.width/3;
  h=img.height;
  image(img,mw1+x*w1,mh1+y*h1,w1,h1,0,0,w,h);
}
void blockG(int x, int y){
  w=img.width/3;
  h=img.height;
  image(img,mw1+x*w1,mh1+y*h1,w1,h1,w,0,w*2,h);
}
void blockB(int x, int y){
  w=img.width/3;
  h=img.height;
  image(img,mw1+x*w1,mh1+y*h1,w1,h1,w*2,0,w*3,h);
}
void blockC(int x, int y){
  noStroke();
  rect(mw1+x*w1,mh1+y*h1,w1,h1);
}
}