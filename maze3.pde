 int num=9;  
int x,y;
int success;

//int[][] Maze=new int[10][10];  // 17/2+2
int[][] Maze=new int[19][19];  // 35/2+2
//int[][] Temp=new int[17][17];
int[][] Temp=new int[35][35];
int x10,y10;
int outline;
int blx=20;
int bly=20;

PGraphics Maze_Texture;
 
void setup() {
  x10=20;
  y10=20;
//  size(600, 600, OPENGL); 
  size(800, 700, P3D);
  background(100);
//  outline=17;  //ok
//  outline=35;   //ok
  outline=29;
//  Maze_Texture=createGraphics(outline*10, outline*10, OPENGL);
   
  for (int i=0;i<(outline/2)+2;i++) {
    for (int j=0;j<(outline/2)+2;j++) {
      if ((i==0 ||i==(outline/2)+1)||(j==0 ||j==(outline/2)+1)) {
        Maze[i][j]=2;
      }
      else {
        Maze[i][j]=0;
      }
    }
  }//初始化，邊緣不計算
 
  for (int i=0;i<outline;i++) {
    for (int j=0;j<outline;j++) {
      if ((i==0 ||(i==outline-1))||(j==0 ||j==(outline-1))) {
        Temp[i][j]=2;
      }
      else {
        Temp[i][j]=0;
      }
    }
  }
  Walker(1, 1);
// Maze[1][0]=3;
// Maze[9][9]=3;
}
void showMaze(){
 noStroke();
  for (int i=0;i<(outline/2)+2;i++) {
    for (int j=0;j<(outline/2)+2;j++) {
      if (Maze[i][j]==2) {
        fill(255, 0, 0);
      }
      else if (Maze[i][j]==1) {
        fill(0, 255, 0);
      }
      else {
        fill(0, 0, 255);
      }
      rect(i*x10, j*y10, x10, y10);
    }
  }
  Temp[1][0]=3;
// Temp[16][15]=3;
   Temp[(outline/2)-1][(outline/2)-2]=3;
  //---將影像寫入buffer
//  Maze_Texture.beginDraw();
//  Maze_Texture.noStroke();
noStroke();
for (int i=0;i<outline;i++) {
    for (int j=0;j<outline;j++) {
//      Maze_Texture.noStroke();
      noStroke();
      if (Temp[i][j]==2) {
//        Maze_Texture.fill(50, 50, 50);
        fill(50, 50, 50);
      }
      else if (Temp[i][j]==1) {
//        Maze_Texture.fill(200, 200, 200);
        fill(200, 200, 200);
      }
      else {
//        Maze_Texture.fill(100, 100, 100);
        fill(100, 100, 100);
      }
//     Maze_Texture. rect(i*10, j*10, 10, 10);
     rect(i*x10, j*y10, x10, y10);
    }
  }
//  Maze_Texture.fill(200, 200, 200);
  fill(200, 200, 200);
//  Maze_Texture. rect(10, 0, 10, 10);
//  rect(10*2, 0, x10, y10);
  rect(1*x10, 0, x10, y10);
//  Maze_Texture. rect(160, 150, 10, 10);
//  rect(160*2, 150*2, x10, y10);
  rect(((outline/2)*2)* x10, ((outline/2)*2-1)*x10, x10, y10);
//  Maze_Texture.endDraw();
  //---結束寫入
}
 
void draw() {
  background(0);
  showMaze();
  fill(255,0,0);
  rect(x,y,blx,bly);

//  camera(mouseX, mouseY, 200, 0, 0, 0, 0, 1, 0);
//  beginShape();
//  textureMode(NORMAL);
//  texture(Maze_Texture);
//  translate(300,300);
//  scale(3);
//  vertex(-100, -100, 0, 0, 0);
//  vertex(100, -100, 0, 1, 0);
//  vertex(100, 100, 0, 1, 1);
//  vertex(-100, 100, 0, 0, 1);
//  endShape();

}
int prex,prey;
color pink = color(255, 102, 204);
color black = color(50, 50, 50);
color black1 = color(100, 100, 100);
void keyPressed(){
  loadPixels();
  prex=x;
  prey=y;
  if(key=='a'){
    x=x-5;
    if (pixels[800*y+x]==black || pixels[800*y+x]==black1){
     x=prex;
     print(pixels[800*y+x-5]);
    } else
     print(pixels[800*y+x]);
  }
  if(key=='d'){
    x=x+5;
    if (pixels[800*y+x+blx]==black || pixels[800*y+x+blx]==black1){
     x=prex;
     print(pixels[800*y+x+5+blx]);
    } else
     print(pixels[800*y+x+blx]);
  }
  if(key=='z'){
    y=y+5;
  }
  if(key=='w'){
    y=y-5;
  }
 if (keyCode == LEFT){
    x=x-5;
  }
 if (keyCode == RIGHT){
    x=x+5;
  }
   if (keyCode == UP){
    y=y-5;
  }
   if (keyCode == DOWN){
    y=y+5;
  }
}
 
void Walker(int x, int y) {
  Temp[x*2-1][y*2-1]=1;
  Maze[x][y]=1;
  for (;;) {
    if ((Maze[x-1][y]!=0)&&(Maze[x][y+1]!=0)&&(Maze[x+1][y]!=0)&&(Maze[x][y-1]!=0)) {
      break;
    }
    int Dircet=(int)random(4)%4;//Direct:0 left,1 down,2 right,3 up
    if ((Dircet==0) && (Maze[x-1][y] !=0 )) continue;
    if ((Dircet==1) && (Maze[x][y+1] !=0 )) continue;
    if ((Dircet==2) && (Maze[x+1][y] !=0 )) continue;
    if ((Dircet==3) && (Maze[x][y-1] !=0 )) continue;
 
    if ((Dircet==0) && (Maze[x-1][y] == 0)) {
      Temp[x*2-2][y*2-1]=1;
      Walker(x-1, y);
    }
    if ((Dircet==1) && (Maze[x][y+1] == 0)) {
      Temp[x*2-1][y*2]=1;
      Walker(x, y+1);
    }  
    if ((Dircet==2) && (Maze[x+1][y] == 0)) {
      Temp[x*2][y*2-1]=1;
      Walker(x+1, y);
    }
    if ((Dircet==3) && (Maze[x][y-1] == 0)) {
      Temp[x*2-1][y*2-2]=1;
      Walker(x, y-1);
    }
  }
}