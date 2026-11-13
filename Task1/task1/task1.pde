void setup() {
  size(500, 500);
  background(100, 80, 110);
  noStroke();
  frameRate(10);
}

void draw() {
  color r = color(random(0, 10), random(0, 100), random(0, 200), random(0, 255));
  fill(r);
  circle(random(width), random(height), random(width /50, height /35));
}
void mousePressed() {
  saveFrame("output-####.png");
}
