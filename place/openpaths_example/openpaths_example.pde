import java.util.date;
import java.text.SimpleDateFormat;


ArrayList<PathPoint> allPoints = new ArrayList();

int step = 0;

PVector rotation = new PVector();
PVector trotation = new PVector();

String label = "";

long startTime;
long endTime;
long currentTime;
long timeMag = 1000000;

float dayPosition = 0;
float daySpeed = 0.001;

long fullDay = 24 * 60 * 60 * 1000;

boolean paused = false;

//convert time stamp to simple date format
SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

void setup() {
  size(900, 600, P3D);
  colorMode(HSB);
  background(0);
  loadPaths("openpaths_blprnt.json");
  
  startTime = allPoints.get(0).timeStamp;
  endTime = allPoints.get(allPoints.size() - 1).timeStamp;
  currentTime = startTime;
}

void draw() {
  long timeStep = (long) (timeMag * (1.0 / frameRate));
  if (!paused) currentTime += timeStep * 1000;
  if (currentTime > endTime) currentTime = startTime;
  //label = new Date(currentTime).toString();
  label = sdf.format(new Date(currentTime));
  
  //playhead for a day
  dayPosition += daySpeed;
  if (dayPosition > 1) dayPosition = 0;
  
  //background(30);
//  for (PathPoint p:allPoints) {
//    p.update();
//    p.render();
//  }

  background(0);

  //float playHead = map(currentTime, startTime, endTime, 0, width);
  float playHead = map(dayPosition, 0, 1, 0, width);
  stroke(255);
  line(playHead, 0, playHead, height);

  
  rotation.lerp(trotation, 0.1);
  if (mousePressed) {
    trotation.x += (mouseY - pmouseY) * 0.01;
    trotation.z += (mouseX - pmouseX) * 0.01;
  }
  
  
  
  for (int i = 0; i < allPoints.size(); i++) {
    PathPoint p = allPoints.get(i);
    
    //if (p.timeStamp < currentTime) {
    if (p.timeOfTheDay < dayPosition) {
      p.update();
      p.render();
      
//      if (i == step) {
//        stroke(255, 0, 0);
//        pushMatrix();
//          translate(p.pos.x, p.pos.y, p.pos.z);
//          ellipse(0, 0, 10, 10);
//        popMatrix();
//      }
    }
  }
  
  
  
}

void loadPaths(String fileName) {
  //load the JSON
  JSONArray path = loadJSONArray(fileName);
  //iterate through entries
  for (int i = 0; i < path.size(); i++) {
    JSONObject point = path.getJSONObject(i);
    
    float lat = point.getFloat("lat");
    float lon = point.getFloat("lon");
    float x = map(lon, -180, 180, 0, width);
    float y = map(lat, -90, 90, height, 0);
    
//    fill(255);
//    noStroke();
    //ellipse(x, y, 3, 3);
    
    //make pathpoint object to hold the data
    PathPoint p = new PathPoint();
    
    p.timeStamp = point.getLong("t") * 1000;
    p.date = new Date(p.timeStamp);
    
    p.timeOfTheDay = (float)(p.timeStamp % fullDay) / (float)(fullDay);
    
    p.lat = lat;
    p.lon = lon;
    p.tpos.x = x;
    p.tpos.y = y;
    
    //add pathpoint to arraylist
    allPoints.add(p);
  }
}

void positionByBounds(float left, float bottom, float right, float top) {
  for (PathPoint p:allPoints) {
    float x = map(p.lon, left, right, 0, width);
    float y = map(p.lat, bottom, top, height, 0);
    p.tpos.set(x, y);
  }
}

void positionByBounds3D(float left, float bottom, float right, float top) {
  long start = allPoints.get(0).timeStamp;
  long end = allPoints.get(allPoints.size() - 1).timeStamp;
  for (PathPoint p:allPoints) {
    float x = map(p.lon, left, right, 0, width);
    float y = map(p.lat, bottom, top, height, 0);
    p.tpos.set(x, y);
  }
}

void keyPressed() {
  if (key == '3') positionByBounds3D(-74.025440044,40.6989295364,-73.8752849606,40.7716067669);
  if (key == 'n') positionByBounds(-74.025440044,40.6989295364,-73.8752849606,40.7716067669);
  if (key == 'g') positionByBounds(-180, -90, 180, 90);
  if (key == 'h') positionByBounds(-74.0020940967,40.693723554,-73.9521892575,40.7198456748);
  if (key == ' ') paused = !paused;
}
