int px,py;
void setup(){
size(400,400);
background(255);

}
void draw(){
background(255);
fill(255);
ellipse(120,200,130,120);
ellipse(280,200,130,120);
fill(100);
ellipse(120+px,200+py,20,15);
ellipse(280+px,200+py,20,15);
}

void mouseMoved(){
px=(int)((mouseX-200)*0.2);
py=(int)((mouseY-200)*0.2);
}
