class Sammo extends Pickup {

  void init() {
    //declaring groundlevel as a referencepoint
    pickupSprite = spritesheet.get(128, 384, 128, 128);
    spawn();
  }

  //the effect that the pick up has
  void effect() {
    if (player.shotgunAmmo < 5) {
      player.shotgunAmmo += 5;
    }
    if (player.shotgunAmmo > 5) {
      player.shotgunAmmo = 5;
    }
    despawn(); //disappear after use
    sndManager.forcePlaySound(14);
  }
}
