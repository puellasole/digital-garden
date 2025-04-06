String axiom = "X"; 
HashMap<String, String> rules = new HashMap<>();
float angle = 25; 
float len = 1;
int generations = 8;
String l;

void setup() {
  size(800, 800);
  background(255);
  stroke(0);
  noLoop(); 
  
  rules.put("X", "F-[[X]+X]+F[+FX]-X");
  rules.put("F", "FF");
  l = generate(generations);
}

void draw() {
  translate(width/2, height);
  for(char c : l.toCharArray()){
    switch(c){
      case 'F':
         line(0,0,0,-len);
         translate(0,-len);
         break;
      case '+':
         rotate(radians(angle));
         break;
      case '-':
         rotate(radians(-angle));
         break;
      case '[':
         pushMatrix();
         break;
      case ']':
         popMatrix();
         break;
      case 'X':
         break;
    }
  }
  
}

String generate(int gens){
  String result = axiom;
  for(int i = 0; i<gens; i++){
    StringBuilder n = new StringBuilder();
    for(char c : result.toCharArray()){
      String rule = rules.get(str(c));
      n.append(rule != null ? rule : c);
    }
    result = n.toString();
  }
  return result;
}
