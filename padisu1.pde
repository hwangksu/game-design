PImage image,score;
int[][] a=new int[5][5];
int x=0;
 int y=0;
 long pre;
void setup(){
 size(800, 600);
 background(100);
 noFill();
// noLoop();
score = loadImage("images.jpg");
image = loadImage("Koala.jpg");
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
 background(100);
for (int j=1; j<6; j++)
    for (int i=1; i<6; i++){
        if(a[i-1][j-1]==1){
             image(image, i*100, j*100,80,80);
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
                    }
          }
      }
  
  }
  for (int j=1; j<6; j++)
      for (int i=1; i<6; i++){
          if(a[i-1][j-1]==2){
                    image(score, i*100, j*100, 90,90) ;
          }
      }
      
}