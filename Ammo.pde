class Ammo {

  class Projectile {
    float x, y, vx, vy;
    int diameter;
    int damage;
    PImage ammo;

    void init() {
      ammo = loadImage("./Art/bullet.png");
      diameter = 10;
      x = p.x + 55;
      y = p.y;
      vx = 30;
      damage = 5;
    }

    void update() {
      x += vx;
    }

    void draw() {
      fill (255, 255, 0);
      imageMode(CENTER);
      image(ammo, x, y);
      imageMode(CORNER);
    }
  }

  class Bullet extends Projectile {
    void init() {
      diameter = 10;
      x = p.x + 55;
      y = p.y;
      vx = 30;
      ammo = loadImage("./Art/bullet.png");
      damage = 5;
    }

    void update() {
      x += vx;

      if (x > width + diameter)
        bullets.remove(this);
    }
  }

  class Bolt extends Projectile {
    void init() {
      diameter = 20;
      x = p.x + 55;
      y = p.y;
      vx = 30;
      ammo = loadImage("./Art/Bolt.png");
      damage = 20;
    }

    void update() {
      x += vx;

      if (x > width + diameter)
        bolts.remove(this);
    }
  }

  class ShotgunShell extends Projectile {
    void init(int dir) {
      diameter = 10;
      x = p.x + 55;
      y = p.y;
      vx = 30;
      vy = dir;
      ammo = loadImage("./Art/Shell.png");
      damage = 5;
    }

    void update() {
      x += vx;
      y += vy;

      if (x > width + diameter)
        shells.remove(this);
    }
  }
}