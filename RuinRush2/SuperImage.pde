class SuperImage {
  PImage photo;
  float x, y;
  int imgMode, opacity;

  void set (int a, int b, String c, int d, int e) {
    x = a;
    y = b;
    photo = loadImage(c);

    if (d > 1)
      d = 1;
    else if (d < 0)
      d = 0;

    imgMode = d;
    opacity = e;
  }

  void set (int a, int b, String c, int d) {
    x = a;
    y = b;
    photo = loadImage(c);

    if (d > 1)
      d = 1;
    else if (d < 0)
      d = 0;

    imgMode = d;
    opacity = 255;
  }

  void draw () {
    switch(imgMode) {
    case 0:
      imageMode(CORNERS);
      break;
    case 1:
      imageMode(CENTER);
      break;
    }

    tint(255, 255, 255, opacity);
    image(photo, x, y);
    imageMode(CORNERS);
    tint(255, 255, 255, 255);
  }
}