String endPoint = "http://wordplay.o-c-r.org/wp/";

void setup() {
  size(700, 700);
  getMatches("this is fun", "mobydick");
}

void draw() {
  
}

void getMatches(String s, String corpus) {
  
  //construct the url
  String url = endPoint + corpus + "/" + s;
  
  //println(url);
  //load the json
  JSONObject j = loadJSONObject(url);
  println(j);
  
}
