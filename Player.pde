class Player {
  //Classes

  //Variables
  float x, y;
  float vx, vy;
  float groundLevel, reloadTimer, magneetTimer, invincibleTimer, invinciblePopupTimer;
  int jumpForce = 15;
  int treasures;
  int handgunAmmo, crossbowAmmo, shotgunAmmo;
  int lifes, curFrame, animSpeed;
  PImage runAnim[] = new PImage[9];
  boolean hasMagneet = false;
  boolean invincible = false;
  boolean dashedDown = false;

  final int FULL_MAGAZINE = 14;
  final int DASH_DOWN_SPEED = 5;

  float radius = 40;

  void init() {
    //Declare x and y
    x = width / 6;

    magneetTimer = 8;
    invincibleTimer = 6;
    handgunAmmo = FULL_MAGAZINE;
    shotgunAmmo = 5;
    crossbowAmmo = 5;
    reloadTimer = 2;
    animSpeed = 8;

    jumping = false;

    lifes = 0;

    //Set gravity and groundLevel
    groundLevel = height * 0.8;

    int loadFrame = 0;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 4; j++) {
        if (loadFrame < 9)
          runAnim[loadFrame] = spritesheet.get(0 + (128 * j), 0 + (128 * i), 128, 128);

        loadFrame++;
      }
    }

    y = groundLevel - 100;
  }

  //Check if the player is on the ground
  boolean OnGround () {
    if(y + (runAnim[curFrame].height - 105) >= groundLevel){
      return true;
    }
    return false;
  }
 

  boolean OnObstakel () {
    boolean b = false;
    for (Obstakel o : s.obstakels) {
      if (y + vy + radius + 10 > o.y - o.h &&
          x > o.x - 10 && 
          x < o.x + o.w + 10 && 
          y < o.y) {
        b = true;
        break;
      } else {
        b = false;
      }
    }
    return b;
  }

  //Makes the player jump when called
  void PlayerJump() {
    vy = -jumpForce;
    sndManager.forcePlaySound(5);
  }
  
  void PlayerDashDown() {
    if (vy < 0)
      vy = DASH_DOWN_SPEED;
    else
      vy += DASH_DOWN_SPEED;
      
    sndManager.forcePlaySound(5);
  }

  void playerDeath() {
    //did you just use a jewel?
    if (!invincible) {
      //check for jewels
      if (lifes < 1) {
        //If you got a highscore save it
        if (dispScore > highscore)
          setHighscore(dispScore);
        //Return to the menu
        _GameState = States.EndScreen;
        sndManager.forcePlaySound(7);
      } else {
        //use jewel
        sndManager.forcePlaySound(8);
        sndManager.forcePlaySound(0);
        lifes--;
        invincible = true;
        invincibleTimer = 0;
      }
    } else {
      if (invinciblePopupTimer <= 0) {
        ScorePopup spp = new ScorePopup((int)p.x, (int)p.y, "Invincible");
        scorePopupParticles.add(spp);
        invinciblePopupTimer = 0.5;
      }
    }
  }

  void update() {
    //If the player is on the ground and the jump
    //key is pressed then do a jump
    if (jumping) {
      if (OnGround() || OnObstakel())
        PlayerJump();
    }

    if (magneetTimer <= 7)
      magneetTimer += deltaTime;

    if (invincibleTimer <= 3)
      invincibleTimer += deltaTime;
    else
      invincible = false;

    if (invinciblePopupTimer > 0)
      invinciblePopupTimer -= deltaTime;      

    //Reload if you dont have full magazine
    if (keyCode == LEFT && keyPressed && handgunAmmo < FULL_MAGAZINE)
      handgunAmmo = 0;

    //Player shoots bullet
    if (firing) {
      Ammo a = new Ammo();

      switch(_CurWeapon) {
      case Handgun:
        if (handgunAmmo > 0) {
          //Create bullet and add to list
          Ammo.Bullet aBullet = a.new Bullet();
          aBullet.init();
          bullets.add(aBullet);
          sndManager.forcePlaySound(18);
          
          //Remove 1 bullet from ammo
          handgunAmmo --;
        }
        break;
      case Shotgun:
        if (shotgunAmmo > 0) {
          //Create 3 shells and add to list
          //Shell 1 goes straight
          Ammo.ShotgunShell aShell = a.new ShotgunShell();
          aShell.init(0);
          shells.add(aShell);
          sndManager.forcePlaySound(19);
          
          //Shell 2 goes down
          Ammo.ShotgunShell bShell = a.new ShotgunShell();
          bShell.init(1);
          shells.add(bShell);

          //Shell 3 goes up
          Ammo.ShotgunShell cShell = a.new ShotgunShell();
          cShell.init(-1);
          shells.add(cShell);

          //Remove 1 shell from ammo
          shotgunAmmo --;
        }
        break;
      case Crossbow:
        if (crossbowAmmo > 0) {
          //Create bolt and add to list
          Ammo.Bolt aBolt = a.new Bolt();
          aBolt.init();
          bolts.add(aBolt);
          sndManager.forcePlaySound(20);
          
          //Remove 1 bolt from ammo
          crossbowAmmo --;
        }
        break;
      }

      firing = false;
    }

    if (handgunAmmo <= 0) {
      reloadTimer -= deltaTime;
      sndManager.playSound(1);
      
      if (reloadTimer <= 0) {
        handgunAmmo = FULL_MAGAZINE;
        reloadTimer = 2;
      }
    }
    
    //If the player is on ground level set it's y velocity to 0

    if (y + vy + (runAnim[curFrame].height - 105) >= groundLevel || OnObstakel()) {
      vy = 0;
      dashedDown = false;
    }

    //If the player is not on the ground add gravity
    if (!OnGround() && !OnObstakel()) {
      vy += GRAVITY;
      if (!dashedDown && keyCode == DOWN && !keyPressed) {
          dashedDown = true;
          PlayerDashDown();
      }
    }

    //Add the velocity to the x and y
    y += vy;

    //Keep up the distance we've ran and add some speed
    _DistanceRan -= _Speed / 50;

    if (right == 0)
      _Speed = -5 - (int)(dispScore / 10000);
    else 
    _Speed = -15;

    //Animation
    if (frameCount % animSpeed == 0 && OnGround() || 
        frameCount % animSpeed == 0 && OnObstakel())
      curFrame++;
    if (curFrame >= 9)
      curFrame = 0;
  }

  void draw () {
    //Orange color and draw the player
    fill(255, 125, 0);

    imageMode(CENTER);
    image(runAnim[curFrame], x, y);
    imageMode(CORNER);
    //    ellipse(x, y, radius, radius);   //hitbox?
  }
}