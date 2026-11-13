void setup() {
  size(500, 500);
  rectMode(CENTER);
  stroke(0);
  strokeWeight(2);
  fill(255);
  frameRate(1000);
}

void draw() {
  background(0);
  translate(width / 2, height / 2);

  int maxIterations = 1000;
  int iterations = (int) map(mouseX, 0, width, 3, maxIterations); // Maus links = 3 Quadrate, Maus rechts = 1000 Quadrate
  for (int i = 0; i < iterations; i++) {
    rotate(radians(map(iterations, 3, maxIterations, 10, 10 * mouseY / height))); // dreht um einen Winkel
    scale(map(mouseX, 0, width, 0.8, 0.97));                    // verkleinert Quadrat
    rect(0, 0, width, height);
  }
}
