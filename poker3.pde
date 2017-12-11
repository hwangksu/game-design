PImage imgground;
int[] a=new int[52];
int ran;
int x,y;
void setup(){
size(1000, 700);
for(int i=0; i<52; i++)
  a[i]=0;

imgground = loadImage("poker.png");
  for(int i=0; i<52; i++){
     ran=int(random(1,52.99));
    while( ! check(i, ran)){
      ran=int(random(1,52.99));
    }
     a[i]=ran;
     println(i,a[i]);
  }
}
boolean check(int ibig,int ra){
    for(int i=0; i< ibig; i++){
      if(a[i] == ran)
       return false;
    }
       return true;
}
void draw(){
  for(int j=0; j<4; j++){
    pushMatrix();
    if(j==0){
      translate(220, 20);
    } else  if(j==1){
      translate(150, 80);
      rotate((PI/2));
    } else  if(j==2){
      translate(220, 600);
    } else  if(j==3){
      translate(950, 80);
      rotate((PI/2));
    } 
    for(int i=0; i<13; i++){
      x=(a[j*13+i]-1)%13;
      y=(a[j*13+i]-1)/13;
 image(imgground,40*i,0,70, 90,(1170/13)*x,(770/5)*y,(1170/13)*(x+1),(770/5)*(y+1));
    }
    popMatrix();
  }
}