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
    for(int i=0; i<13; i++){
      x=(a[j*13+i]-1)%13;
      y=(a[j*13+i]-1)/13;
 image(imgground,(1000/13)*x,(700/4)*y,1000/13-10, 700/4-10,(1170/13)*i,(770/5)*j,(1170/13)*(i+1),(770/5)*(j+1));
    }
  }
}