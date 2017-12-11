PImage imgground;

void setup(){
size(1000, 700);
   imgground = loadImage("poker.png");
}

void draw(){
//1000, 700為畫面大小,1170,770為圖片大小
//顯示畫面的座標與大小,擷取圖片的左上座標與右下座標
   image(imgground,(1000/13)*5,(700/5)*4,1000/13, 700/5,(1170/13)*0,(770/5)*0,(1170/13)*1,(770/5)*1);
}