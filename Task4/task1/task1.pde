void setup() {
  size(512, 512);
  fill(50);
  frameRate(60);
}

void draw() {
  background(0);

  translate(width / 2, height / 2);
  int recursionDepth = (int)map(mouseX, 0, width, 1, 6);
  drawFractal(recursionDepth);
}


void drawFractal(int recursionDepth) {
  if (0 == recursionDepth) {
    circle(0, 0, width);
  } else {
    --recursionDepth;
    rotate(0.001 * millis());
    scale(0.4);

    for (float sX = -1; sX < 2; sX += 2) {
      for (float sY = -1; sY < 2; sY += 2) {

        pushMatrix();

        scale(sX, sY);
        translate(width / 2, height / 2);

        drawFractal(recursionDepth);

        popMatrix();
      }
    }
  }
}
