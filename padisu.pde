PImage teddy;

float xpos;
float ypos;
float drag = 30;
void setup() {
  size(600, 600);
  teddy = loadImage("teddy.gif");
  xpos = width/2;
  ypos = height/2;
   score = loadImage("score.gif");

}
void draw() { 
  background(102);
// Display the sprite at the position xpos, ypos
for int j=1; j<6; j++)
  for (int i=1; i<6; i++){
       image(teddy, i*100, ypos);
  }

}