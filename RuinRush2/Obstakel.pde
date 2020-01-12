class Obstakel { //<>// //<>//
  //variables
  float x, y; //position
  int w, h;
  PImage pickupSprite;

  void init() {
   pickupSprite = spritesheet.get(384, 384, 40, 40);
    y = height * 0.8 + player.radius - random(0, 200);
    w = h = 100;
    x = width + w * 2;
  }

  void init(int s) {
     pickupSprite = spritesheet.get(384, 384, 40, 40);
    y = height * 0.8 + player.radius;
    w = h = s;
    x = width + w * 2;
  }

  void init(int size, int xPos, int yPos) {
    pickupSprite = spritesheet.get(384, 384, 40, 40);
    y = yPos;
    w = h = size;
    x = width + xPos;
  }
  
  boolean touchesPlayer() {
    if (player.x > x - (player.radius / 2) &&            //right side p > left side pu
      player.x < x + w + (player.radius / 2) &&          //left side p < right side pu
      player.y > y - h - (player.radius / 2) &&          //bottom p > top pu
      player.y < y + (player.radius / 2)) {              //top p < bot pu
//check hitbox      
//      print("p.x:" + p.x + " p.y:" + p.y + " x:" + x +  " y:" + y + " w/h:" + w + "/" + h + " p.rad:" + p.radius); 
      return true;
    } else 
    return false;
  }

  boolean touchesBullet (Ammo.Bullet k) {
    if (k.x > x - k.diameter &&
      k.x < x + w + k.diameter &&
      k.y > y - h - k.diameter &&
      k.y < y + k.diameter) {
      return true;
    } else
      return false;
  }

  boolean touchesBolt (Ammo.Bolt k) {
    if (k.x > x - k.diameter &&
      k.x < x + w + k.diameter &&
      k.y > y - h - k.diameter &&
      k.y < y + k.diameter) {
      return true;
    } else
      return false;
  }

  boolean touchesShell (Ammo.ShotgunShell k) {
    if (k.x > x - k.diameter &&
      k.x < x + w + k.diameter &&
      k.y > y - h - k.diameter &&
      k.y < y + k.diameter) {
      return true;
    } else
      return false;
  }

  void checkHit() {
    for (int i = 0; i < bullets.size(); i++) {
      Ammo.Bullet aBullet = bullets.get(i);
      if (touchesBullet(aBullet)) {
        bullets.remove(aBullet);
      }
    }

    for (int i = 0; i < bolts.size(); i++) {
      Ammo.Bolt aBolt = bolts.get(i);
      if (touchesBolt(aBolt)) {
        bolts.remove(aBolt);
      }
    }

    for (int i = 0; i < shells.size(); i++) {
      Ammo.ShotgunShell aShell = shells.get(i);
      if (touchesShell(aShell)) {
        shells.remove(aShell);
      }
    }
  }
  
  void despawn() {
    x = -10 - w;
    s.removeme.add(this);
  }

  void update() {
    //add speed to the object to give the illusion the player is moving towards it
    x += _Speed;

    checkHit();

    if (touchesPlayer()) {
      player.playerDeath();
    }
    
    if (x < -10 - w){
      despawn();
    }
  }

  void draw() {
    rectMode(CORNER);
    imageMode(CORNER);
    image(pickupSprite, x, y-pickupSprite.height);
    imageMode(CORNER);
    
  }
}
