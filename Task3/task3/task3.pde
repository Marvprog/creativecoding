float symmetry = 6;

void setup() {
  size(800, 800);
  background(0);
  stroke(90, 20, 60, 250);
  strokeWeight(width / 100);
}

void draw() {
  if (!mousePressed) {
    return;
  }

  float centerX = width / 2;
  float centerY = height / 2;
  float mX = mouseX - centerX;                    //current
  float mY = mouseY - centerY;                    //current
  float pmX = pmouseX - centerX;                  //previous
  float pmY = pmouseY - centerY;                  //previous

  translate(centerX, centerY);
  for (float i = 0; i < symmetry; i++) {
    rotate(radians(360 / symmetry));
    line(mX, mY, pmX, pmY);                        // Linie alter zu neuer Punkt
    pushMatrix();                                  // Drehung speichern
    scale(1, -1);                                  // y-Achse umdrehen
    line(mX, mY, pmX, pmY);                        // Linie alter zu neuer Punkt (gespiegelt)
    popMatrix();                                   // Spiegelung aufheben, zurück zur gespeicherten Drehung
  }
}
