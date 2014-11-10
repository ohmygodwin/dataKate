class PathPoint {
 
 PVector lonlat = new PVector();
 long timeStamp;
 Date date;
 
 PVector pos = new PVector();
 PVector tpos = new PVector();
 
 color col = 255;
 
 float lon;
 float lat;
 
 float timeOfTheDay = 0;
 
 void update() {
   pos.lerp(tpos, 0.1);
 }
 
 void render() {
   pushMatrix();
     translate(pos.x, pos.y, pos.z);
     fill(col);
     noStroke();
     ellipse(0, 0, 2, 2);
   popMatrix();
 }
  
}
