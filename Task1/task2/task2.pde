size(960, 540);
PImage img = loadImage("pb.jpg");
img.resize(width, height);
noStroke();
background(0);
float circleSize = 25;
ellipseMode(CORNER);

for (int x = 0; x < width; x += circleSize) {
  for (int y = -100; y < height; y += circleSize) {
    fill(img.get(x, max(y, 0)));
    circle(x, y, circleSize);
  }

  circleSize *= 0.964;
  circleSize = max(circleSize, 1);
}

saveFrame("output.jpg");
