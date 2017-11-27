PImage img;
PImage[] imgs=new PImage[16];
int i=1;
int j=0;
int k=0;

void setup(){
size(900,600); //0-400 for picture,500-900 for changed picture
background(225);
img=loadImage("img02.jpg");//any 400X400 Image;already have 01-05
img.loadPixels(); 
image(img,0,0);
loadPixels();
translate(450,0);
fill(2);
  for(i=0;i<16;i++){
    imgs[i]=createImage(100,100,RGB);
    img.loadPixels(); 
      for(k=0;k<100;k++){
        for(j=0;j<100;j++){
        // imgs[i].pixels[j+k*100]=img.pixels[(i%4)*100+j+(k+int(i/4))*400];//wrong
        //imgs[i].pixels[j+k*100]=img.pixels[(i%4)*100+j+(i/4+k)*400];//still wrong
         imgs[i].pixels[j+k*100]=img.pixels[(i%4)*100+j+((i/4)*100+k)*400];//right}
        }
      imgs[i].updatePixels(); //right
      image(imgs[i],(i%4)*110,(i/4)*110); //right
      text(i,-100,i*25); //check i loop();
    }
  }
}
void draw(){
  
}