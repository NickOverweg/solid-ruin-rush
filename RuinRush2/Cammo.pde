class Cammo extends Pickup {

  void init() {
    //declaring groundlevel as a referencepoint
    pickupSprite = spritesheet.get(256, 384, 128, 128);
    spawn();
  }

  //the effect that the pick up has
  void effect() {
    if (p.crossbowAmmo < 5) {
      p.crossbowAmmo += 5;
    }
    if (p.crossbowAmmo > 5) {
      p.crossbowAmmo = 5;
    }
    sndManager.forcePlaySound(14);
    despawn(); //disappear after use
  }
}