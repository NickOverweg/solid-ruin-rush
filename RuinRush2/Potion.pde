class Potion extends Pickup {
  //potion time
  float PT = 100;

  void init() {
    //declaring groundlevel as a referencepoint
    super.pickupSprite = spritesheet.get(256, 256, 128, 128);
    spawn();
  }

  void update() {
    if (active) {
      //setting velocity
      vx = _Speed;

      //Add the velocity to the x
      x += vx;

      //this enables the effect when player touches the pickup
      if (touchesPlayer(player))
      {
        effect();
      }

      // check if pickup hasnt left the screen
      if (x < (0 - size)) {
        despawn();
      }
    } else {
      timer++;
    }
    if (PT < 100) {
      PT += deltaTime;
      CW=2;
    }
    if (PT >= 99) {
      CW=1;
    }
  }

  //the effect that the pick up has
  void effect() {
    PT=0;//gives extr
    sndManager.forcePlaySound(14);
    despawn(); //disappear after use
  }
}
