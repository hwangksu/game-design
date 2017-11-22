PImage image,score,hole;
int[][] a=new int[5][5];
int x=0;
 int y=0;
 long pre;
 int number;
 int level=10;
void setup(){
 size(700, 700);
 background(0,100,0);
// noFill();
// noLoop();
score = loadImage("images.jpg");
image = loadImage("Koala.jpg");
hole = loadImage("hole.png");
// image(image,0,0,100,100);
  for (int j=0; j<5; j++)
    for (int i=0; i<5; i++){
        if(random(10)>5){
             a[i][j]=1;
        }else{
             a[i][j]=0;
        }
    }


}
void draw(){
  if((millis()-pre)>=level*500){
    pre=pre+level*500;
    level--;
    if(level<1)
    level=1;
  for (int j=0; j<5; j++)
    for (int i=0; i<5; i++){
        if(random(10)>5){
             a[i][j]=1;
        }else{
             a[i][j]=0;
        }
    }
  }
 background(0,100,0);
int d = day();    // Values from 1 - 31
int mo = month();  // Values from 1 - 12
int y = year();   // 2003, 2004, 2005, etc.
int s = second();  // Values from 0 - 59
int mi = minute();  // Values from 0 - 59
int h = hour();    // Values from 0 - 23

String st = String.valueOf(y);
      textSize(12);
text(st, 10, 20);
st = String.valueOf(mo);
text(st, 50, 20); 
st = String.valueOf(d);
text(st, 70, 20);
st = String.valueOf(h);
text(st, 90, 20);
st = String.valueOf(mi);
text(st, 110, 20); 
st = String.valueOf(s);
text(st, 130, 20);
 stroke(255); //
 fill(0);
//ellipse(x+50, y+50, 100, 100);
// ellipse(x+30, y+30, 20, 20);
//ellipse(x+70, y+30, 20, 20);
// arc(x+50, y+50, 80, 30,0.6,2.28);
// triangle(x+40,y+ 60, x+60, y+60, x+50, y);
for (int j=1; j<6; j++)
    for (int i=1; i<6; i++){
        if(a[i-1][j-1]==1){
             image(image, i*100, j*100,100,100);
        }else if(a[i-1][j-1]==0){
             image(hole, i*100, j*100,100,100);
        }
    }
  if(mousePressed){
        fill(0,0,200,255);
        ellipse(mouseX, mouseY, 50, 50);
  for (int j=1; j<6; j++)
      for (int i=1; i<6; i++){
          if(a[i-1][j-1]==1){
                    if( dist(mouseX, mouseY, i*100+40, j*100+40)<50 ){
                       a[i-1][j-1]=2 ;
                       number=number+11-level;
                    }
          }
      }
  
  }
  for (int j=1; j<6; j++)
      for (int i=1; i<6; i++){
          if(a[i-1][j-1]==2){
                    image(score, i*100, j*100, 100,100) ;
          }
      }
      textSize(40);
      text(number,100,60);
      textSize(12);
      
}