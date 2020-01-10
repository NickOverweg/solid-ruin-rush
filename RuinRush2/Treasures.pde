//coin waarde
float CW = 1;
class Treasures extends Pickup {
  //Variables
  float radius = 25;
  PImage pickupSprite;

  private final int MAGNET_PULL_SPEED = 20;

  void init() {
    //declaring groundlevel as a referencepoint
    pickupSprite = spritesheet.get(384, 256, 128, 128);
    spawn();
  }

  void update() {
    if (active) {

      if (p.magneetTimer > 7) {
        //setting velocity
        vx = _Speed;
        vy = 0;

        // check if pickup hasnt left the screen
        if (x < (0 - size)) {
          despawn();
        }
      } else {
        float distanceToPlayer = sqrt(pow(p.x - x, 2) + pow(p.y - y, 2));

        if (distanceToPlayer < width / 2) {
          vx = ((p.x - x) / distanceToPlayer) * MAGNET_PULL_SPEED;
          vy = ((p.y - y) / distanceToPlayer) * MAGNET_PULL_SPEED;
        } else {
          vx = _Speed;
          vy = 0;
        }
      }

      //this enables the effect when player touches the pickup
      if (touchesPlayer(p))
      {
        effect();
      }

      //Add the velocity to the x
      x += vx;
      y += vy;
    } else {
      timer++;
    }
  }

  //the effect that the pick up has
  void effect() {
    _TreasureCollected += CW; //gives extr
    sndManager.forcePlaySound(13);
    despawn(); //disappear after use
    score += 100;
  }

  //call to despawn pickup
  void despawn() {
    if (active) {
      ScorePopup spp = new ScorePopup((int)p.x, (int)p.y, 5);
      scorePopupParticles.add(spp);

      x = -10 - (2*radius);
    }
    active = false;
  }

  void draw() {
    /* fill(255, 255, 0);
     ellipse(x, y, radius, radius);*/
    fill(150, 150, 250);
    //rectMode(CORNER);
    //rect(x, y, size, size);
    imageMode(CENTER);
    image(pickupSprite, x, y);
    imageMode(CORNER);
  }
}