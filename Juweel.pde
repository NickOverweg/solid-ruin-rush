class Juweel extends Pickup { 
  void init() {
    pickupSprite = spritesheet.get(128, 256, 128, 128); 
    spawn();
  }
  
  void effect() {
    if(p.lifes == 1){
      ScorePopup spp = new ScorePopup((int)p.x, (int)p.y, 1000);
      scorePopupParticles.add(spp);
    }else{
    p.lifes = 1;
    }
    sndManager.forcePlaySound(14);
    despawn(); //disappear after use
  }
}