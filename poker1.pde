PImage imgground;

void setup(){
size(1000, 700);
   imgground = loadImage("poker.png");
}

void draw(){
//1000, 700為畫面大小,1170,770為圖片大小
//顯示畫面的座標與大小,擷取圖片的左上座標與右下座標
for(int j=0; j<4; j++){
  for(int i=0; i<13; i++){
    image(imgground,(1000/13)*i,(700/4)*j,1000/13-10, 700/4-10,(1170/13)*i,(770/5)*j,(1170/13)*(i+1),(770/5)*(j+1));
  }
}
}