int seed = 0;

void setup() {
  size(1024, 1024);
  noStroke();
}

void draw() {
  int bigCircleSize = width / 16;  
  randomSeed(seed);
  background(255);
  fill(0);
  ellipseMode(CORNER);

  for (int x = 0; x < width; x += bigCircleSize) {
    for (int y = 0; y < height; y += bigCircleSize) {

      float shiftX = random(-2, 2) * mouseX / bigCircleSize;
      float shiftY = random(-2, 2) * mouseY / bigCircleSize;
      circle(x + shiftX, y + shiftY, bigCircleSize);
    }
  }

  int smallCircleSize = bigCircleSize / 2;
  ellipseMode(CENTER);
  fill(255);
  for (int x = smallCircleSize; x < width; x += bigCircleSize) {
    for (int y = smallCircleSize; y < height; y += bigCircleSize) {
      circle(x, y, smallCircleSize);
    }
  }
}

void mousePressed() {
  seed++;
}
