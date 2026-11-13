
int invaderPixels = 7;

void setup() {
  size(500, 500);
  background(0);
  noStroke();
  frameRate(1);
}

color randomPixelColor() {
  return color(random(100, 255), random(100, 255), random(100, 255));
}


color selectPixelColor(color[] pixelColors) {
  return pixelColors[floor(random(pixelColors.length))];
}

void drawInvaderPixel(int column, int row) {
  int pixelSize = width / invaderPixels;
  rect(pixelSize * column, pixelSize * row, pixelSize, pixelSize);
}

void draw() {


  color[] pixelColors = {
    randomPixelColor(),
    randomPixelColor(),
    randomPixelColor(),
    color(0),
    color(0),
    color(0)
  };

  int symmetricColumnCount = invaderPixels / 2;

  for (int row = 0; row < invaderPixels; row++) {

    for (int column = 0; column < symmetricColumnCount; column++) {

      drawInvaderPixel(column, row);
      drawInvaderPixel(invaderPixels - 1 - column, row);

      fill(selectPixelColor(pixelColors));
    }

    if (0 != invaderPixels % 2) {

      drawInvaderPixel(symmetricColumnCount, row);

      fill(selectPixelColor(pixelColors));
    }
  }
}
