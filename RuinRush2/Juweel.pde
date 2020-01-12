class Juweel extends Pickup { 
  void init() {
    pickupSprite = spritesheet.get(128, 256, 128, 128); 
    spawn();
  }
  
  void effect() {
    if(player.lifes == 1){
      ScorePopup spp = new ScorePopup((int)player.x, (int)player.y, 1000);
      scorePopupParticles.add(spp);
    }else{
    player.lifes = 1;
    }
    sndManager.forcePlaySound(14);
    despawn(); //disappear after use
  }
}
