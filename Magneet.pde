class Magneet extends Pickup
{
  void init() {
    pickupSprite = spritesheet.get(0, 384, 128, 128); 
    spawn();
  }

  void effect() {
    p.magneetTimer = 0;
    despawn();
    sndManager.forcePlaySound(9);
  }
}