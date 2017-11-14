PImage teddy,teddy0,score;
int[][] a=new int[5][5];
float xpos;
float ypos;
float drag = 30;
long pre;
int number;

void setup() {
  size(600, 600);
  teddy = loadImage("Koala.jpg");
  teddy0 = loadImage("teddy0.png");
  xpos = width/2;
  ypos = height/2;
   score = loadImage("images.jpg");

for (int j=1; j<6; j++)
  for (int i=1; i<6; i++){
    if(random(10)>5)
       a[i-1][j-1]=1;
    else
       a[i-1][j-1]=0;
  }
}
void draw() { 
  background(102);
// Display the sprite at the position xpos, ypos
if(millis()-pre>2000){
  pre=pre+2000;
for (int j=1; j<6; j++)
  for (int i=1; i<6; i++){
    if(random(10)>5)
       a[i-1][j-1]=1;
    else
       a[i-1][j-1]=0;
  }
}
for (int j=1; j<6; j++)
  for (int i=1; i<6; i++){
    if(a[i-1][j-1]==1)
       image(teddy, i*100, j*100, 100,100);
  }
for (int j=1; j<6; j++)
  for (int i=1; i<6; i++){
    if(a[i-1][j-1]==0)
       image(teddy0, i*100, j*100, 100,100);
  }
if(mousePressed){
  for (int j=1; j<6; j++)
  for (int i=1; i<6; i++){
    if(a[i-1][j-1]==1){
       if( dist(mouseX,mouseY, i*100+40, j*100+40)<40){
          a[i-1][j-1]=2;
          number++;
       }
    }
  }

}

for (int j=1; j<6; j++)
  for (int i=1; i<6; i++){
    if(a[i-1][j-1]==2)
       image(score, i*100, j*100, 100,100);
  }

textSize(40);
text(number,10,40);
}