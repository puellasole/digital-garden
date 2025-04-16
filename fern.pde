int maxIterations = 100000;
float x = 0, y = 0;

void setup() {
  size(800, 800);
  background(255);
  noLoop();
}

void draw() {
  translate(width/2, height);
  scale(70);
  strokeWeight(0.01);

  for (int t = 0; t < maxIterations; t++) {
    float r = random(1);
    float xn, yn;

    if (r < 0.01) {
      xn = 0;
      yn = 0.16 * y;
    } 
    else if (r < 0.86) {
      xn = 0.85 * x + 0.04 * y;
      yn = -0.04 * x + 0.85 * y + 1.6;
    } 
    else if (r < 0.93) {
      xn = 0.2 * x - 0.26 * y;
      yn = 0.23 * x + 0.22 * y + 1.6;
    } 
    else {
      xn = -0.15 * x + 0.28 * y;
      yn = 0.26 * x + 0.24 * y + 0.44;
    }

    // Градиент от темно-зеленого к светлому
    stroke(0, 100 + (t % 155), 0);
    point(xn, -yn);
    
    x = xn;
    y = yn;
  }
}
