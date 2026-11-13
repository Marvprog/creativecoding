final float maxTranslationFactor = 1;              //Verschiebung
final float maxRotationFactor = 0.1;               //Drehung

void setup() {
  size(500, 1000);
  strokeWeight(3);
}

void draw() {
  background(255);
  float border = 50;
  float rectSize = (width - 2 * border) / 12;
  randomSeed(1);
  translate(border, border);

  for (int row = 0; row < 24; row++) {
    for (int column = 0; column < 12; column++) {
      pushMatrix();                                         // speichert die aktuelle Matrix
      translate(column * rectSize, row * rectSize);
      float weight = sin(0.003 * millis());
      float translationFactor = weight * maxTranslationFactor;
      float rotationFactor = weight * maxRotationFactor;

      translate(translationFactor * random(-2, 2) * row, translationFactor * random(-2, 2) * row);
      rotate(rotationFactor * random(-2, 2) * row);
      rect(0, 0, rectSize, rectSize);
      popMatrix();                                          // stellt die gespeicherte Matrix wieder her
    }
  }
}
