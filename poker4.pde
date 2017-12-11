PImage imgground;
int[] a=new int[52];
int ran;
int x,y;
int x1,y1;
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
//      if(a[j*13+i] == 0 && j==1){
      if(a[j*13+i] == 0 ){
 image(imgground,40*i,0,70, 90,(1170/13)*2,(770/5)*4,(1170/13)*(2+1),(770/5)*(4+1));        
//      } else  if(a[j*13+i] == 0 && j==2){
// image(imgground,40*i,290,70, 90,(1170/13)*2,(770/5)*4,(1170/13)*(2+1),(770/5)*(4+1));        
      } else{
      x=(a[j*13+i]-1)%13;
      y=(a[j*13+i]-1)/13;
 image(imgground,40*i,0,70, 90,(1170/13)*x,(770/5)*y,(1170/13)*(x+1),(770/5)*(y+1));
      }
    }
    popMatrix();
  }
}

void mousePressed(){
    pushMatrix();
      translate(220, 0);
   for(int i=0; i<13; i++){
    if( a[0*13+i]!=0 ){
      if( mouseY <90 && mouseY>10 && mouseX<((i+1)*40)+220 && mouseX>(i*40)+220){
        x1=(a[0*13+i]-1)%13;
        y1=(a[0*13+i]-1)/13;
   image(imgground,50+30*i,130,70, 90,(1170/13)*x1,(770/5)*y1,(1170/13)*(x1+1),(770/5)*(y1+1));        
        a[0*13+i]=0;
      }
    }
  }
      popMatrix();
      
    pushMatrix();
      translate(150, 80);
      rotate((PI/2));
  for(int i=0; i<13; i++){
    if( a[1*13+i]!=0 ){
      if( mouseX <150 && mouseX>50 && mouseY<((i+1)*40)+80 && mouseY>(i*40)+80){
        x1=(a[1*13+i]-1)%13;
        y1=(a[1*13+i]-1)/13;
   image(imgground,50+30*i,-100,70, 90,(1170/13)*x1,(770/5)*y1,(1170/13)*(x1+1),(770/5)*(y1+1));        
        a[1*13+i]=0;
      }
    }
  }
    popMatrix();

    pushMatrix();
      translate(220, 600);
   for(int i=0; i<13; i++){
    if( a[2*13+i]!=0 ){
      if( mouseY <690 && mouseY>600 && mouseX<((i+1)*40)+220 && mouseX>(i*40)+220){
        x1=(a[2*13+i]-1)%13;
        y1=(a[2*13+i]-1)/13;
   image(imgground,50+30*i,-100,70, 90,(1170/13)*x1,(770/5)*y1,(1170/13)*(x1+1),(770/5)*(y1+1));        
        a[2*13+i]=0;
      }
    }
  }
      popMatrix();

     pushMatrix();
      translate(950, 80);
      rotate((PI/2));
  for(int i=0; i<13; i++){
    if( a[3*13+i]!=0 ){
      if( mouseX <950 && mouseX>870 && mouseY<((i+1)*40)+80 && mouseY>(i*40)+80){
        x1=(a[3*13+i]-1)%13;
        y1=(a[3*13+i]-1)/13;
   image(imgground,50+30*i,100,70, 90,(1170/13)*x1,(770/5)*y1,(1170/13)*(x1+1),(770/5)*(y1+1));        
        a[3*13+i]=0;
      }
    }
  }
    popMatrix();
}