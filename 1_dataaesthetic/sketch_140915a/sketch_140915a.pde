int[] counts;

void setup() {
  size(800, 600);
  colorMode(HSB);
  loadData();
}

void draw() {
  background(0);
  //renderCircles(counts);
  translate(50, 50);
  renderGrid(counts, 10, 25, 10);
}

void loadData() {
  Table myTable = loadTable("monkeyData.csv");
  counts = new int[myTable.getRowCount()];
  
//  for(TableRow row:myTable.rows()) {
//    println(row.getInt(0)); //'every tree in the forest loop' (no count)
//  }
  
  //it might be good to turn this into an array so that it's more usable
  
  for(int i = 0; i < myTable.getRowCount(); i++) {
    println(myTable.getRow(i).getInt(0)); //could use getString for that type
    counts[i] = myTable.getRow(i).getInt(0);
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
