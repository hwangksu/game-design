//source
//http://www.makezine.com.tw/make2599131456/processing1youbike
//import processing.http.requests.*;
import http.requests.*;
//宣告一個全域變數url，也就是「YouBike臺北市公共自行車即時資訊RID」的範例網址
String url = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=ddb80380-f1b3-4f8e-8016-7ed9cba571d5";

void setup(){
  //發送HTTP GET request，這個動作跟我們在瀏覽器上輸入網址是一樣的
    GetRequest get = new GetRequest(url);
    get.send();
//當Youbike公開資料是以一個JSONObject回傳，所以要用JSONObject來接收回傳的資料(紅框)
  JSONObject response = parseJSONObject(get.getContent());
//重要資料都是在results這個Array中，但是results被包含在result這個object中，所以特別讀取出來(綠框)->(黃框)
    JSONArray bikelists = response.getJSONObject("result").getJSONArray("results");
    //取得JSONArray後，就逐一讀出各站JSONObject資訊(藍框)
    for(int l=0; l<bikelists.size(); l++){
      JSONObject bikelist = bikelists.getJSONObject(l);
       //getString()裏頭的變數是對照JSONObject中的欄位名
       println("地點:" + bikelist.getString("sna") + "經度:" + bikelist.getString("lat") + "緯度:" + bikelist.getString("lng") + " 總車位:" +bikelist.getString("tot") + " 剩餘車位" + bikelist.getString("sbi"));
    }
}

void draw(){
}