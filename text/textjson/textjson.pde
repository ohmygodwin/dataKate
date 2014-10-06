String endPoint = "http://wordplay.o-c-r.org/wp/";

JSONArray currentResults;

void setup() {
  size(700, 700, P3D);
  //shakes, freud, bieber, mobydick, bible
  currentResults = getMatches("blah blah blah", "freud");
}

void draw() {
  background(255);
  renderResults(currentResults);
}

JSONArray getMatches(String s, String corpus) {
  
  //construct the url
  String url = endPoint + corpus + "/" + s;
  //println(url);
  
  //load the json
  JSONObject j = loadJSONObject(url);
  //println(j);
  
  //get the results array
  JSONArray results = j.getJSONArray("results");
  
  return(results);
  
}

void renderResults(JSONArray results) {
  
 for (int i = 0; i < results.size(); i++) {
   String seg = results.getJSONObject(i).getString("segment");
   //println(seg);
   fill(0);
   text(seg, 50, 50 + (i*20));
 }
 
}
