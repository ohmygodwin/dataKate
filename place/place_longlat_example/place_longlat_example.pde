String endpoint = "http://intotheokavango.org/api/timeline?date=20140821&types=ambit_geo";

void setup() {
  size(600, 600, P3D);
  loadGeo();
}

void draw() {
  
}

void loadGeo() {
 JSONObject j = loadJSONObject(endpoint);
 //println(j);  
 
 JSONArray features = j.getJSONArray("features");
 
 for (int i = 0; i < features.size(); i++) {
   JSONObject f = features.getJSONObject(i);
   JSONObject geom = f.getJSONObject("geometry");
   JSONArray coords = geom.getJSONArray("coordinates");
   //println(coords.getFloat(0));
   float lat = coords.getFloat(0);
   float lon = coords.getFloat(1);
   float alt = coords.getFloat(2);
 }
}

//x = map(lon, -180, 180, 0, width);
//y = map(lat, -90, 90, height, 0);
