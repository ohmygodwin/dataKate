import rita.*;

String dataPath = "../../../data/";
//a hashmap is a high level dictionary
HashMap<String, String> stopList = new HashMap();

IntDict counter = new IntDict();

PFont label;

float left = 0;

void setup() {
  size(600, 600);
  makeStopList("stop.txt");
  countWords("mobydick.txt");
  
  label = createFont("Helvetica", 120);
  textFont(label);

}

void draw() {
  background(0);
  
  float xOffset = map(mouseX, 0, width, 0, left - width);
  
  pushMatrix();
    translate(-xOffset, 0);
    renderWords();
  popMatrix();
}

void renderWords() {
  
  //calculates one set of random numbers
  randomSeed(0);
  String[] theKeys = counter.keyArray();
  
  left = 0;
  for (int i = 0; i < 100; i++) {
    String word = theKeys[i];
    int count = counter.get(word);
    float x = i * 50;
    //float y = random(50, height-50);
    float y = height/2;
    float s = sqrt(count) * 5;
    
    
    fill(255, 100);
    textSize(s);
    
    float w = textWidth(word);
    text(word, left, y);
    textSize(16);
    text(count, 0, y + 20);
    //rotate(.1);
    translate(w, 0);
    left += w;
  }
}

void makeStopList(String url) {
  String[] stops = loadStrings(dataPath + url);
  for (String s:stops) {
   stopList.put(s, s); 
  }
}

boolean checkStop(String word) {
  return (stopList.containsKey(word.toLowerCase()));
}

void countWords(String url) {
  //creating an integer dictionary - allows you to count strings
  
  
  //brings data in as an array
  String[] rows = loadStrings(dataPath + url);
  String text = join(rows,"");
  String[] sentences = RiTa.splitSentences(text);
  
  for (String s:sentences) {
    String[] words = RiTa.tokenize(RiTa.stripPunctuation(s));
    for (String w:words) {
       //counter.add(w.toLowerCase(), 1);
       if (!checkStop(w)) {
         counter.increment(w.toLowerCase());
       }
    }
  }
  
  //descending sort
  counter.sortValuesReverse();
  String[] theKeys = counter.keyArray();
  //println(theKeys[i] + ": " + counter.get(theKeys[i]));
}
