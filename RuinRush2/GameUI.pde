class GameUI {
  SuperText distText;
  SuperText magazineText;
  SuperText treasuresText;
  SuperText magneetText;
  SuperText invincibleText;
  SuperText helpText;

  void init() {
    //Define distance text
    distText = new SuperText();
    magazineText = new SuperText();
    treasuresText = new SuperText();
    magneetText = new SuperText();
    invincibleText = new SuperText();
    helpText = new SuperText();

    distText.set(25, 50, "0m", 32, color(0, 0, 0), 0);
    magazineText.set(25, 100, "14", 32, color (0, 0, 0), 0);
    treasuresText.set(25, 150, "0", 32, color(255, 255, 0), 0);
    invincibleText.set(25, 200, "", 32, color(255, 0, 255), 0); 
    magneetText.set(25, 250, "", 32, color(255, 0, 0), 0); 
  }

  void update() {
    //Update the text of distance text
    dispScore = score +(int)Math.round(_DistanceRan)*(int)CW;
    distText.t = dispScore + "";
    //distText.t = Math.round(_DistanceRan) + "";

    switch(_CurWeapon) {
    case Handgun:
      if (player.handgunAmmo != 0)
        magazineText.t = "Bullets: " + player.handgunAmmo;
      else 
      magazineText.t = "Bullets: RELOADING";
      break;
    case Shotgun:
      magazineText.t = "Shells: " + player.shotgunAmmo;
      break;
    case Crossbow:
      magazineText.t = "Bolts: " + player.crossbowAmmo;
      break;
    }

    //Update the amount of collected treasures
    treasuresText.t = "Treasures: " + Math.round(_TreasureCollected)+ "";

    if (player.magneetTimer <= 7) 
      magneetText.t = "Magnet Power: " + round(7 - player.magneetTimer);
    else
      magneetText.t = "";  

    if (player.invincibleTimer <= 3) 
      invincibleText.t = "Jewel breaks! Invincible for: " + round(3 - player.invincibleTimer);
    else
      invincibleText.t = "Jewels: " + player.lifes;
  }

  void draw () {
    //Draw distance text
    distText.draw();
    magazineText.draw();
    treasuresText.draw();
    magneetText.draw();
    invincibleText.draw();
    //Draw image tutorial
    if (_Tutorial) {
      imageMode(CENTER);
      image(tutorialImage, width/2, height/2);
      imageMode(CORNER);
    }
  }
}
