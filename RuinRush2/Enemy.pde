class Enemy {

  //Variables
  float x, y;
  float HP;
  int w, h;
  PImage enemy;

  void init() {
    enemy = enemySpritesheet.get(0, 0, 128, 128);
    x = 1280;
    y = height * 0.8 + 25;
    w = h = 50;
    HP = 5;
  }

  boolean touchesPlayer() {
    if (player.x > x - player.radius &&            //right side p > left side pu
      player.x < x + w + player.radius &&          //left side p < right side pu
      player.y > y - h - player.radius &&          //bottom p > top pu
      player.y < y + player.radius) {              //top p < bot pu
      return true;
    } else 
    return false;
  }

  boolean touchesBullet (Ammo.Bullet k) {
    if (k.x > x - k.diameter &&
      k.x < x + w + k.diameter &&
      k.y > y - h - k.diameter &&
      k.y < y + k.diameter &&
      HP > 0) {
      return true;
    } else
      return false;
  }

  boolean touchesBolt (Ammo.Bolt k) {
    if (k.x > x - k.diameter &&
      k.x < x + w + k.diameter &&
      k.y > y - h - k.diameter &&
      k.y < y + k.diameter &&
      HP > 0) {
      return true;
    } else
      return false;
  }

  boolean touchesShell (Ammo.ShotgunShell k) {
    if (k.x > x - k.diameter &&
      k.x < x + w + k.diameter &&
      k.y > y - h - k.diameter &&
      k.y < y + k.diameter &&
      HP > 0) {
      return true;
    } else
      return false;
  }

  void checkHit() {
    for (int i = 0; i < bullets.size(); i++) {
      Ammo.Bullet aBullet = bullets.get(i);
      if (touchesBullet(aBullet)) {
        showBlood((int)aBullet.x);
        HP -= aBullet.damage;      
        sndManager.forcePlaySound(17);
        bullets.remove(aBullet);
      }
    }

    for (int i = 0; i < bolts.size(); i++) {
      Ammo.Bolt aBolt = bolts.get(i);
      if (touchesBolt(aBolt)) {
        showBlood((int)aBolt.x);
        HP -= aBolt.damage;
        sndManager.forcePlaySound(17);
        bolts.remove(aBolt);
      }
    }

    for (int i = 0; i < shells.size(); i++) {
      Ammo.ShotgunShell aShell = shells.get(i);
      if (touchesShell(aShell)) {
        showBlood((int)aShell.x);
        HP -= aShell.damage;
        sndManager.forcePlaySound(17);
        shells.remove(aShell);
      }
    }
  }

  void showBlood(int bx) {
    for (int i = 0; i < BLOOD_SPLASHES; i++) {
      Blood b = new Blood((int)(x + (w/2)), (int)(y - (h/2)), (int)(bx - x));
      bloodParticles.add(b);
    }
  }

  void update() {
    x += _Speed;
    y = height * 0.8 + 25;
    checkHit();

    if (touchesPlayer() && HP > 0) {
      player.playerDeath();
    }
  }

  void despawn() {
    x = -10 - w;

    ScorePopup spp = new ScorePopup((int)player.x, (int)player.y, 25);
    scorePopupParticles.add(spp);

    s.removeme.add(this);
  }

  void draw() {
    if (HP > 0) {
      rectMode(CENTER);
      if (enemy != null)
        image(enemy, x, y-enemy.height);
      rectMode(CORNER);
      fill(255, 0, 0);
    } else {
      sndManager.forcePlaySound(16);
      despawn();
    }
  }
}

class Enemy1 extends Enemy {
  float vy;

  void init() {
    x = 1280;
    y = -height;
    enemy = enemySpritesheet.get(128, 0, 128, 97);
    //The w h variables are kept in the code for collision detection reference
    w = h = 128;
    HP = 5;
  }

  boolean onGround() {
    return y >= height * 0.8 + 25;
  }

  void update() {
    checkHit();

    if (!onGround()){
      vy += GRAVITY;
      enemy = enemySpritesheet.get(256, 0, 128, 97);
    }
    else {
      vy = 0;
      y = height * 0.8 + 25;
      enemy = enemySpritesheet.get(128, 0, 128, 97);
    }

    if (DistanceCalc.getDistance((int)x, (int)player.x, (int)y, (int)player.y) < 200 && !player.OnGround() && onGround())
      vy -= 15;

    if (touchesPlayer() && HP > 0)
      player.playerDeath();

    x += _Speed;
    y += vy;
  }
}

class Enemy2 extends Enemy {

  void init() {
    x = 1280;
    y = -height;
    enemy = enemySpritesheet.get(0, 0, 128, 128);
    w = h = 128;
    HP = 20;
  }
}

class Enemy3 extends Enemy {

  void init() {
    x = 1280;
    y = -height;
    enemy = enemySpritesheet.get(0, 128, 209, 201);
    w = h = 200;
    HP = 45;
  }
}
