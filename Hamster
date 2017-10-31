PImage teddy,tiger;
int[][] pos=new int[5][5];

float xpos;
float ypos;
float drag = 30;
long pre;
int score;

void setup() {
size(600, 600);
teddy = loadImage("teddy.png");
tiger = loadImage("tiger.png");
xpos = width/2;
ypos = height/2;
score=0;
}
void draw() { 
background(0,50,00,255);
// Display the sprite at the position xpos, ypos
if((millis()-pre)>1000){
pre=millis();
for (int j=0; j<5; j++)
for (int i=0; i<5; i++){
if(random(10)>5)
pos[i][j]=1;
else
pos[i][j]=0;
}
}
for (int j=1; j<6; j++)
for (int i=1; i<6; i++){
if(pos[i-1][j-1]==1)
image(teddy, i*100, j*100);
}
if(mousePressed){
fill(0,0,200,255);
ellipse(mouseX, mouseY, 50, 50);

for (int j=1; j<6; j++)
for (int i=1; i<6; i++){
if(pos[i-1][j-1]==1)
if(mouseX<(i* 100)+50 && mouseX>i*100 && mouseY<(j* 100)+50 && mouseY>(j* 100)){
image(tiger, mouseX, mouseY);
score++;
}
} 
}
textSize(26);
text(score,60,60);
}
void mouseMoved() {
fill(200,0,0,255);
ellipse(mouseX, mouseY, 150, 50);
// image(tiger, mouseX, mouseY);
}
void mousePressed(){
fill(0,0,200,255);
ellipse(mouseX, mouseY, 50, 50);
}
