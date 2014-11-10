//use terminal to preview large files - type in head and then path to file

void setup() {
  size(900, 600, P3D);
  background(30);
  stroke(255);
  loadHotels("hotelsbase.csv");
}

void draw() {
  
}

void loadHotels(String fileName) {
  String[] rows = loadStrings(fileName);
  for (String r:rows) {
    String[] cols = r.split("~");
    if (cols.length >= 13) {
      float lat = float(cols[12]);
      float lon = float(cols[13]);
      
      float x = map(lon, -180, 180, 0, width);
      float y = map(lat, -90, 90, height, 0);
      
      stroke(255);
      point(x, y);
      fill(255, 0, 0);
      noStroke();
      if (cols[1].toLowerCase().indexOf("motel") != -1) ellipse(x, y, 3, 3);
    }
  }
}
