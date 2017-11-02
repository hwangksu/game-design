/* Processing輸入中文好簡單 DDLab,LFking */
PFont myFont;
String[] lines;
void setup() {
  size(640, 360);
  background(0);
  myFont = createFont("標楷體",100,true);
  /* 直接輸入字型名稱，只要電腦有安裝該自行即可顯示 */
  textFont(myFont);
  /* list.txt要以UTF-8編碼 */
  lines = loadStrings("list.txt");
}
void draw() {
  textSize(30);
  text("數位藝術,Nice", 0 ,height/2);
  text(lines[0], 5, 20);
}