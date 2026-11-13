void setup() {
  size(700, 700);
  noSmooth();
  noLoop();
}

color rndColor() {
  return color(random(0, 255), random(0, 255), random(0, 255));
}

color random(color[] colors) {
  return colors[floor(random(colors.length))];
}

void draw() {
  final int pixelSize = 2;
  final int invaderPixels = 15;
  final int borderSize = 4;

  final int invaderSize = invaderPixels * pixelSize;
  int cellSize = invaderSize + 2 * borderSize;
  background(0);
  for (int x = borderSize; x < width; x += cellSize) {
    for (int y = borderSize; y < height; y += cellSize) {
      PImage inv = createInvader(invaderPixels);
      image(inv, x, y, invaderSize, invaderSize);
    }
  }
}

PImage createInvader(int invaderPixels) {
  PImage imgInvader = createImage(invaderPixels, invaderPixels, ARGB);

  color transparent = color(0, 0, 0, 0);
  color[] colors = { rndColor(), rndColor(), rndColor(), transparent, transparent, transparent };
  int symmetricColumnCount = invaderPixels / 2;
  for (int row = 0; row < invaderPixels; row++) {
    for (int column = 0; column < symmetricColumnCount; column++) {
      final color c = random(colors);
      imgInvader.set(column, row, c);
      imgInvader.set(invaderPixels - 1 - column, row, c);
    }
    if (0 != invaderPixels % 2) {
      imgInvader.set(symmetricColumnCount, row, random(colors));
    }
  }
  return imgInvader;
}

void mousePressed() {
  redraw();
}