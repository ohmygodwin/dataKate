String endPoint = "http://api.wefeelfine.org:8080/ShowFeelings?";

void setup() {
  size(700, 700, P3D);
  smooth(4);
  loadRecentFeelings();
}

void draw() {
  
}

void loadRecentFeelings() {
  
  //form url and load XML
  String url = endPoint + "returnfields=feeling,sentence&display=xml";
  XML feelingXML = loadXML(url);
  //println(feelingXML);
  
  for (int i = 0; i < feelingXML.getChildCount(); i++) {
    XML feeling = feelingXML.getChild(i);
    try {
      //println(feeling.getString("feeling"));
      String fstring = feeling.getString("feeling");
      text(fstring, random(0, width-50), random(50, height));
    }
    catch (Exception e) {
      
    }
  }
}
