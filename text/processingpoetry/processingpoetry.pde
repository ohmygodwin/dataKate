float x, y;
float speed;
boolean saveMe = false;

void setup() {
  size( 430, 430, P3D );
  background( 30 );
}

void draw() {
  if (keyPressed && key == 's') {
    saveFrame("frame-######.png");
    saveMe = false;
  }
  
  renderPattern();
}

void renderPattern() {
  speed+=.004;

  pushMatrix();
    translate( width / 2, height / 2 );
    
    for (int i = 0; i < 100; i += 5) {
      x = sin( ( speed + i ) * 200 ) * 200;
      y = cos( speed + i ) * 200;
      
      noStroke();
      fill( 196, 205, 202, 100 );
      ellipse( x, y, 2, 2 );
    }
  popMatrix();
}
