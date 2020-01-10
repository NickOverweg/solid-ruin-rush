class Blood {
  private int x, y, diameter, r;
  private float vx, vy;
  private float t;

  public Blood(int x, int y, int dir) {
    this.x = x;
    this.y = y;

    diameter = (int)random(5, 10);
    r = (int)random (150, 255);

    if (dir != 0)
      vx = (dir / abs(dir)) * random(1, 4);
    vy = -random(5, 10);

    t = 255;
  }

  void update() {
    vy += GRAVITY;

    t--;

    x -= vx;
    y += vy;

    if (t <= 0)
      bloodParticles.remove(this);
  }

  void draw() {
    tint(max(t, 0));
    fill (r, 0, 0);
    ellipse(x, y, diameter, diameter);
    tint (255);
  }
}