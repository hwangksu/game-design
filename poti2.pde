int x[]=new int[10];
int y[]=new int[10];
int fire[]=new int[10];
PImage poti;
int potix,potiy;

void setup() {
  size(1000, 800); 
//   frameRate(10);
   poti = loadImage("poti.jpg");
   for(int i=0; i<10; i++){
    x[i]=0;
    y[i]=0; 
    fire[i]=0;
   }
  potix=550;
  potiy=700;
}

void draw() {
  background(0);
  for(int i=0; i<10; i++){
   if ( fire[i]==1){
      y[i]=y[i]-5;
      if(y[i]< 0){
        fire[i]=0;
      }
   }
   ellipse(x[i],y[i],20,20);
  }
image(poti, potix, potiy,100,100);
}
void keyPressed(){
  if(key==' '){
    for(int i=0; i<10; i++){
      if (fire[i]==0){
        fire[i]=1;
        x[i]=potix+25;
        y[i]=potiy;
        break;
      }
    }
  }
  if(key=='a'){
    potix=potix-5;
  }
  if(key=='d'){
    potix=potix+5;
  }
  if(key=='z'){
    potiy=potiy+5;
  }
  if(key=='w'){
    potiy=potiy-5;
  }
}