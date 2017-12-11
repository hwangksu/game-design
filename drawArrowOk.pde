void setup(){
  size(800,800);
}

void draw(){
  background(255);
  strokeWeight(2);
  stroke(0,0,255);
  drawArrow(400,400,120,190);
  stroke(255,0,0);
  drawArrow(400,400,120,210);
  stroke(0,255,0);
  drawArrow(400,400,120,230);
  stroke(0,0,255);
  drawArrow(400,400,120,250);
  stroke(255,0,255);
  drawArrow(400,400,120,270);
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