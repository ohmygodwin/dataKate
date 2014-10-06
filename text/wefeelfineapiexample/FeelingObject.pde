class FeelingObject {
 
 String feeling;
 
 PVector pos = new PVector();
 PVector tpos = new PVector();
 
 PVector rot = new PVector();
 PVector trot = new PVector();
 
 boolean isHappy = false;
 
 FeelingObject() {
   
 }
  
  void update() {
    pos.lerp(tpos, 0.1);
    rot.lerp(trot, 0.1);
    
    //check if happy
    if (isHappy) {
      //we are happy
      if (tpos.y > 20) {
        tpos.y -= feeling.length() * 0.1;
      } else {
        trot.z = PI/2;
      }
      
    }
    else if (tpos.y < height - 20) {
      tpos.y += feeling.length() * 0.1;
    }
  }
  
  void render() {
    pushMatrix();
      translate(pos.x, pos.y);
      rotateZ(rot.z);
      text(feeling, 0, 0);
    popMatrix();
  }
  
}
