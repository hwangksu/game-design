//由這個網頁抄來的
//http://belleaya.pixnet.net/blog/post/31860741-%5B%E6%95%99%E5%AD%B8%5D-%5B%E7%A8%8B%E5%BC%8F%5D-%E7%94%A8processing%E5%AF%AB%E7%89%B9%E8%A8%9399
//這裡有他的討論區
//https://www.facebook.com/belleaya/posts/230634663748811?ref=notif&notif_t=share_comment
int mapSizex=480; //地圖x軸寬度
int mapSizey=480; //地圖y軸寬度
int playerx=mapSizex/2,playery=mapSizey/2; //玩家位置

int i=0; //迴圈專用暫存

int maxWalkSpeed=3; //最大走速
float walkAccelx=0; //x走路加速度
float walkAccelxtmp=0; //x走路加速度temp
float walkSpeedx=0; //x初走速
float walkAccely=0; //y走路加速度
float walkAccelytmp=0; //y走路加速度temp
float walkSpeedy=0; //y初走速

int maxConnon=99; //畫面上最大砲彈數
float minConnonSpeed=0.5; //炮彈最小速
float maxConnonSpeed=2; //炮彈最大速
float[] connonv= new float[maxConnon+1]; //特定一顆砲彈總速度(會有x分速跟y分速)
float[] connonx= new float[maxConnon+1]; //特定一顆砲彈x
float[] connonxv= new float[maxConnon+1]; //特定一顆砲彈x速
float[] connony= new float[maxConnon+1]; //特定一顆砲彈y
float[] connonyv= new float[maxConnon+1]; //特定一顆砲彈y速
float[] connonw= new float[maxConnon+1]; //特定一顆砲彈寬度

boolean gamestart=false; //遊戲開始沒
boolean gameover=false; //死了沒
int score=0; //得分

//變數設定END---------------------------------------------------------------

 

//剛開始時初值設定
void setup(){

  size(mapSizex,mapSizey+10);
  background(0);
  
  playerx=floor(mapSizex/2); //玩家位置重設
  playery=floor(mapSizey/2);
  
  for(i=1;i<=maxConnon;i++){ 
    //砲彈用for迴圈來設定砲彈1號~99號的x位置、y位置、發設初速、x分速、y分速、砲彈大小
    switch(floor(random(1,4.99))){ //看從上下左右哪邊發射
      case 1: //從左發射就將x定在-10位置，y位置隨機
      connonx[i]=-10;
      connony[i]=random(-10,mapSizey+10);
      break;
      case 2: //從上發射就將y定-10位置，x位置隨機
      connonx[i]=random(-10,mapSizex+10);
      connony[i]=-10;
      break;
      case 3: //從右發射就將x定在總x軸寬度+10位置，y位置隨機
      connonx[i]=mapSizex+10;
      connony[i]=random(-10,mapSizey+10);
      break;
      case 4://從下發射就將y定在總y軸寬度+10位置，x位置隨機
      connonx[i]=random(-10,mapSizex+10);
      connony[i]=mapSizey+10;
      break;
    }
    connonv[i]=random(minConnonSpeed,maxConnonSpeed); //砲彈射速
    connonxv[i]=connonv[i]*((playerx-connonx[i])/sqrt(sq(connonx[i]-playerx)+sq(connony[i]-playery))); //x分速
    connonyv[i]=connonv[i]*((playery-connony[i])/sqrt(sq(connonx[i]-playerx)+sq(connony[i]-playery))); //y分速
    connonw[i]=3; //預設砲彈寬度是3，之後難度閃久一點之後難度變難才會有變化
  }
  
}


//初值設定END------------------------------------------------------------------------------



//主程式 (跟c語言的main意思差不多)
void draw(){
  if(gamestart){ //判斷是否開始玩了
    gameStart(); //這是我自己設定的函數，用來重繪畫面的邊線
    update(); //這也是我自己設定的函數用來每次更新玩家位置
    setConnon(); //設定砲彈位置用
    scoreShow(); //顯示分數
  }
  else{
    //如果還沒開始玩就在畫面上顯示字"Click to Start!"
    textSize(20);
    fill(250, 160, 0);
    text("Click to Start!", floor(mapSizex/3), floor(mapSizey/2)); 
  }
}

 

//鍵盤按下 (主要判斷方向鍵來控制移動的加速度)
void keyPressed(){
  //只要按了該鍵，該方向的加速度就會改變
  //這樣的用意是讓玩家移動更順暢，不需要靠連按就能移動
  //不過我沒有設定如果反方向同時按會怎樣...有興趣可以自己加判斷式
  switch(keyCode){
    case LEFT:
      walkAccelx=-0.2;
      walkAccelxtmp=0;
    break;
    case RIGHT:
      walkAccelx=0.2;
      walkAccelxtmp=0;
    break;
    case UP:
      walkAccely=-0.2;
      walkAccelytmp=0;
    break;
    case DOWN:
      walkAccely=0.2;
      walkAccelytmp=0;
    break;
  }
}


 

//鍵盤放開 (主要用來判斷當方向鍵放開時要減速的、及按空白鍵Replay)
//跟上面按下的不同，我把加速度設成0，另外用tmp來記住原本的加速度，用來為玩家減速
void keyReleased(){
  switch(keyCode){
    case LEFT:
    walkAccelxtmp=walkAccelx;
    walkAccelx=0;
    break;
    case RIGHT:
    walkAccelxtmp=walkAccelx;
    walkAccelx=0;
    break;
    case UP:
    walkAccelytmp=walkAccely;
    walkAccely=0;
    break;
    case DOWN:
    walkAccelytmp=walkAccely;
    walkAccely=0;
    break;
    //game over後按空白鍵
    case ' ':
      if(gameover==true){
        score=0;
        gameover=false;
        frameCount=0;
        setup();
        redraw();
      }
    break;
  }
}

//滑鼠
//主要是Game over後用來重新開始遊戲
//而這是因為網頁版的空白鍵失靈所以加上來的...原因我還不知道為什麼
void mouseClicked() {
  if(gameover==true){
      score=0;
      gameover=false;
      frameCount=0;
      setup(); //如果已經Game over我就把所有值都重設
      redraw(); //draw那邊重新再run
  }
  if(gamestart==false){
      gamestart=true; //按了之後就開始遊戲所以讓gamestart=true
  }
}

//-------------------------------------------------------------------------------------
//自己設的函數-----------------------------------------------------------------------
//-------------------------------------------------------------------------------------

void gameStart(){
  background(0);//背景設定為黑
  stroke(50); //畫四條邊界線用，其實不一定需要啦~我只是想顯示玩家移動範圍邊邊
  line(10,10,mapSizex-10,10);
  line(mapSizex-10,10,mapSizex-10,mapSizey-10);
  line(mapSizex-10,mapSizey-10,10,mapSizey-10);
  line(10,mapSizey-10,10,10);
}

void update(){
  //更新玩家目前y的位置
  //我先判斷是否在移動範圍內，若沒有就先把玩家擋下
  if(playery>=10&&playery<=mapSizey-10){
    //先更新位置
    playery+=walkSpeedy;
    //如果玩家是在按著上或下鍵的情況下才需要去移動，我就是用加速度來判斷
    if(walkAccely!=0){ 
      //判斷有沒有大於最大速度，如果沒有的話就加速，否則速度就是最大速不能再加
      if(abs(walkSpeedy)<maxWalkSpeed){
        walkSpeedy+=walkAccely;
      }
      else{
        if(walkSpeedy>0){
          walkSpeedy=maxWalkSpeed;
        }
        else{
          walkSpeedy=-maxWalkSpeed;
        }
      }
    }
    //若玩家沒有按著上或下鍵盤
    else{
      //要是y速度的絕對值還比0.2大就繼續減速，若小於0.2就變成0
      if(abs(walkSpeedy)>0.2){
        walkSpeedy-=walkAccelytmp;
      }
      else{
        walkSpeedy=0;
        walkAccelytmp=0;
      }
    }
  }
  //若已經在移動範圍外就讓玩家停住並且強制擋在邊邊
  else{
    if(playery<10){
      walkSpeedy=0;
      playery=10;
      walkAccely=0;
    }
    if(playery>mapSizey-10){
      walkSpeedy=0;
      playery=mapSizey-10;
      walkAccely=0;
    }
  }
  
  //x跟y差不多的意思，就不多解釋囉
  if(playerx>=10&&playerx<=mapSizex-10){
    playerx+=walkSpeedx;
    if(walkAccelx!=0){
      if(abs(walkSpeedx)<maxWalkSpeed){
        walkSpeedx+=walkAccelx;
      }
      else{
        if(walkSpeedx>0){
          walkSpeedx=maxWalkSpeed;
        }
        else{
          walkSpeedx=-maxWalkSpeed;
        }
      }
    }
    else{
      if(abs(walkSpeedx)>0.2){
        walkSpeedx-=walkAccelxtmp;
      }
      else{
        walkSpeedx=0;
        walkAccelxtmp=0;
      }
    }
  }
  else{
    if(playerx<10){
      walkSpeedx=0;
      playerx=10;
      walkAccelx=0;
    }
    if(playerx>mapSizex-10){
      walkSpeedx=0;
      playerx=mapSizex-10;
      walkAccelx=0;
    }
  }
  
  //把玩家的點畫出來
  noStroke();
  fill(240,220,0);
  ellipse(playerx,playery,8,8);
}


//砲彈
void setConnon(){
  //這邊一樣用for迴圈來更新砲彈
  for(i=1;i<=maxConnon;i++){
    //先判斷任何一顆砲彈目前有沒有打到玩家
    //因為砲彈是圓的所以就判斷砲的圓心跟玩家圓心距離是否小於半徑跟半徑
    //但其實我這邊判斷式如果砲彈半徑大的話就會有問題，正確而言要用畢式定理來判斷才行
    //不過現在暫時懶得改XDDD
    if(abs(connonx[i]-playerx)<connonw[i]&&abs(connony[i]-playery)<connonw[i]){
      gameover=true;
    }
    else{
      if((connonx[i]>mapSizex+10)||(connonx[i]<-10)||(connony[i]<-10)||(connony[i]>mapSizey+10)||gameover){
        //如果已經射出界就再重新設定新砲彈，並且加一分代表閃過一顆砲彈
        switch(floor(random(1,4.99))){ //看從上下左右哪邊發射
          case 1: //左
          connonx[i]=-10;
          connony[i]=random(-10,mapSizey+10);
          break;
          case 2: //上
          connonx[i]=random(-10,mapSizex+10);
          connony[i]=-10;
          break;
          case 3: //右
          connonx[i]=mapSizex+10;
          connony[i]=random(-10,mapSizey+10);
          break;
          case 4: //下
          connonx[i]=random(-10,mapSizex+10);
          connony[i]=mapSizey+10;
          break;
        }
        connonv[i]=random(minConnonSpeed,maxConnonSpeed);
        connonxv[i]=connonv[i]*((playerx-connonx[i])/sqrt(sq(connonx[i]-playerx)+sq(connony[i]-playery)));
        connonyv[i]=connonv[i]*((playery-connony[i])/sqrt(sq(connonx[i]-playerx)+sq(connony[i]-playery)));

        //如果還沒Game over的話，只要閃過一顆就加一分
        if(!gameover){
          score+=1;
        }
        //如果時間超過一千影格就把砲彈半徑加大
        if(frameCount>=1000&&frameCount<2000){
          connonw[i]=floor(random(3,15));
        }
        if(frameCount>=2000&&frameCount<4000){
          connonw[i]=floor(random(3,30));
        }
        if(frameCount>=4000){
          connonw[i]=floor(random(3,80));
        }
      }

      //砲彈還沒射出界的話就繼續飛
      else{
        connonx[i]+=connonxv[i];
        connony[i]+=connonyv[i];
        noStroke();
        fill(250,20,0);
        ellipse(connonx[i],connony[i],connonw[i],connonw[i]);
      }
    }
  }
}


//分數、顯示Game over
void scoreShow(){
  if(gameover){
    fill(0);
    rect(-10,-10,mapSizex+10,mapSizey+30);
    
    textSize(30);
    fill(250, 160, 0);
    text("Your Score: "+score, floor(mapSizex/3), floor(mapSizey/2)); 
  }
  else{
    textSize(10);
    fill(240, 220, 0);
    text("Your Score: "+score, 10, mapSizey+5);
  }
}
