int[] years;
String[] urls;
int[] heights;

void setup() {
  size(1300, 900);
  loadRiotData();
  loadToyData();
}

void draw() {
  background(0);
  //renderCircles(counts);
  //translate(50, 50);
  //renderGrid(counts, 10, 25, 10);
  renderImages();
}

void loadRiotData() {
  Table myTable = loadTable("riotgearMedia.csv", "header");
  years = new int[myTable.getRowCount()];
  urls = new String[myTable.getRowCount()];
  heights = new int[myTable.getRowCount()];
  
  for(TableRow row:myTable.rows()) {
    int yearT = row.getInt("year");
    String urlT = row.getString("url");
    int heightT = row.getInt("height");
    //println(row.getInt(0)); //'every tree in the forest loop' (no count)
  }
  
  //it might be good to turn this into an array so that it's more usable
  
  for(int i = 0; i < myTable.getRowCount(); i++) {
    println(myTable.getRow(i).getInt(0)); //could use getString for that type
    years[i] = myTable.getRow(i).getInt(0);
    
    println(myTable.getRow(i).getString(1));
    urls[i] = myTable.getRow(i).getString(1);
    
    println(myTable.getRow(i).getInt(2));
    heights[i] = myTable.getRow(i).getInt(2);
  }

}

void loadToyData() {
  Table myTable = loadTable("riotgearMedia.csv", "header");
  years = new int[myTable.getRowCount()];
  urls = new String[myTable.getRowCount()];
  heights = new int[myTable.getRowCount()];
  
  for(TableRow row:myTable.rows()) {
    int yearT = row.getInt("year");
    String urlT = row.getString("url");
    int heightT = row.getInt("height");
    //println(row.getInt(0)); //'every tree in the forest loop' (no count)
  }
  
  //it might be good to turn this into an array so that it's more usable
  
  for(int i = 0; i < myTable.getRowCount(); i++) {
    println(myTable.getRow(i).getInt(0)); //could use getString for that type
    years[i] = myTable.getRow(i).getInt(0);
    
    println(myTable.getRow(i).getString(1));
    urls[i] = myTable.getRow(i).getString(1);
    
    println(myTable.getRow(i).getInt(2));
    heights[i] = myTable.getRow(i).getInt(2);
  }

}

void renderImages() {
  
  PImage webImg;
  
  for (int i = 0; i < years.length; i++) {
    float xPos = (i % 6) * (200);
    float yPos = (floor(i / 6)) * (100);
    String url = "http://nytimes.com/" + urls[i];
    println(urls[i]);
    // Load image from a web server
    webImg = loadImage(url, "jpg");
    webImg.resize(200, 0);
    image(webImg, xPos, yPos);

  }
}

void renderGrid(int[] nums, int cols, float boxSize, float padding) {
  
  for(int i = 0; i < nums.length; i++) {
     float x = (i % cols) * (boxSize + padding);
     float y = (floor(i / cols)) * (boxSize + padding);
     float w = boxSize;
     float c = map(nums[i], 0, max(nums), 60, 255);
     fill(c, 255, 255);
     noStroke();
     rect(x, y, w, w);
  }
}

void renderCircles(int[] nums) {
  for(int i = 0; i < nums.length; i++) {
    float x = map(i, 0, nums.length, 100, width - 100);
    float y = height/2;
    //float d = map(nums[i], 0, max(nums), 0, 100); //these ellipses lie because area is exponential!
    float d = map(sqrt(nums[i]), 0, sqrt(max(nums)), 0, 100);
    float c = map(nums[i], min(nums), max(nums), 0, 255);
    noFill();
    stroke(c, 255, 0);
    ellipse(x, y, d, d);
  }
}
