class Pickup {
  //Variables
  float x, y;
  float vx, vy;
  float groundLevel;
  PImage pickupSprite;

  float size = 30;

  boolean active;
 
  int timer;
  
  void init() {
    //declaring groundlevel as a referencepoint
    pickupSprite = spritesheet.get(384, 256, 128, 128);
    spawn();
  }

  void update() {
    if (active) {
        //setting velocity
        vx = _Speed;
  
        //this enables the effect when player touches the pickup
        if (touchesPlayer(player))
        {
          effect();
        }

        // check if pickup hasnt left the screen
        if (x < (0 - size)) {
          despawn();
        }
      
      //Add the velocity to the x
      x += vx;
    } else {
      timer++;
    }
  }

  //check if player is touching the pickup
  boolean touchesPlayer(Player p) {
    if ((p.x + p.radius)  > x          &&    //right side p > left side pu
      (p.x - p.radius)     < (x+size)   &&    //left side p < right side pu
      (p.y + p.radius)     > y          &&    //bottom p > top pu
      (p.y - p.radius)     < (y+size)) {       //top p < bot pu
      return true;
    }
    //else
    return false;
  }

  //the effect that the pick up has
  void effect() {
    score += 50; //gives extr      
    sndManager.forcePlaySound(14);
    despawn(); //disappear after use
  }

  //call to despawn pickup
  void despawn() {
    active = false;
    x = -10 - size;
    s.removeme.add(this);
  }

  //call to start pickup
  void spawn() {

    x = width + size;
    y = (height * 0.8) - 5;
    active = true;
    timer = 0;
  }

  void spawn(int setHeight) {

    x = width + size;
    y = setHeight;
    active = true;
    timer = 0;
  }


  void draw () {
    //blue(?) color and draw the pickup
    fill(247, 239, 156);
    rectMode(CORNER);
    //rect(x, y, size, size);
    imageMode(CENTER);
    image(pickupSprite, x, y);
    imageMode(CORNER);
  }
}
