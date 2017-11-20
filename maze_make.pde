  
int[][] Maze=new int[10][10];
//int[][] Temp=new int[21][21];
int[][] Temp=new int[17][17];
 
int outline;
PGraphics Maze_Texture;
 
void setup() {
//  size(600, 600, OPENGL); 
  size(600, 600, P3D);
  background(100);
  outline=17;
   
//  Maze_Texture=createGraphics(outline*10, outline*10, OPENGL);
   
  for (int i=0;i<10;i++) {
    for (int j=0;j<10;j++) {
      if ((i==0 ||i==9)||(j==0 ||j==9)) {
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
 noStroke();
  for (int i=0;i<10;i++) {
    for (int j=0;j<10;j++) {
      if (Maze[i][j]==2) {
        fill(255, 0, 0);
      }
      else if (Maze[i][j]==1) {
        fill(0, 255, 0);
      }
      else {
        fill(0, 0, 255);
      }
      rect(i*10, j*10, 10, 10);
    }
  }
  Temp[1][0]=3;
 Temp[16][15]=3;
  
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
     rect(i*10, j*10, 10, 10);
    }
  }
//  Maze_Texture.fill(200, 200, 200);
  fill(200, 200, 200);
//  Maze_Texture. rect(10, 0, 10, 10);
  rect(10, 0, 10, 10);
//  Maze_Texture. rect(160, 150, 10, 10);
  rect(160, 150, 10, 10);
//  Maze_Texture.endDraw();
  //---結束寫入
}
 
void draw() {
//  background(0);
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