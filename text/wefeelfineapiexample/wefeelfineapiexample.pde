String endPoint = "http://api.wefeelfine.org:8080/ShowFeelings?";

ArrayList<FeelingObject> feelingList = new ArrayList();
PFont label;

void setup() {
  size(700, 700, P3D);
  smooth(4);
  loadRecentFeelings();
  
  label = createFont("Helvetica", 18);
}

void draw() {
  background(0);
  for (FeelingObject f:feelingList) {
    f.update();
    f.render();
  }
}

void loadRecentFeelings() {
  
  //form url and load XML
  String url = endPoint + "returnfields=feeling,sentence&display=xml&city=atlanta";
  XML feelingXML = loadXML(url);
  //println(feelingXML);
  
  for (int i = 0; i < feelingXML.getChildCount(); i++) {
    XML feeling = feelingXML.getChild(i);
    
    try {
      //println(feeling.getString("feeling"));
      String fstring = feeling.getString("feeling");
      text(fstring, random(0, width-50), random(20, height-20));
      FeelingObject fo = new FeelingObject();
      fo.feeling = fstring;
      fo.tpos.set(random(0, width-50), random(20, height-20));
      feelingList.add(fo);
      
      String happyList = "happy,glad,awesome,fine,good,ok,great,well";
      //fo.isHappy = (fo.feeling.length() < 6);
      //checking to see if a happy word is present
      fo.isHappy = (happyList.indexOf(fo.feeling) != -1);
    }
    catch (Exception e) {
      
    }
  }
}
