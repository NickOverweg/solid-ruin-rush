class SuperText {
  //Parameters for the button
  int x, y;
  float s;
  String t;
  color col;
  int align = 0;
  int maxSize, minSize; 
  double timer = 0;

  void set (int a, int b, String c, int d, color e, int f) {
    x = a;
    y = b;
    t = c;
    s = d;
    col = e;

    if (f > 5)
      f = 5;
    else if (f < 0)
      f = 0;

    align = f;
    minSize = (int)s;
    maxSize = (int)(s * 1.2);
  }

  void update() {
    timer += deltaTime;
    s = minSize + (float)(Math.sin(timer * 2) * (maxSize - minSize));
  }

  void draw() {
    //Draw the text
    switch (align) {
    case 0:
      textAlign(LEFT);
      break;
    case 1: 
      textAlign(CENTER);
      break;
    case 2:
      textAlign(RIGHT);
      break;
    case 3:
      textAlign(CENTER, BOTTOM);
      break;
    case 4:
      textAlign(CENTER, CENTER);
      break;
    case 5:
      textAlign(CENTER, TOP);
      break;
    }

    textSize(s);
    fill (col);
    text(t, x, y);
  }
}