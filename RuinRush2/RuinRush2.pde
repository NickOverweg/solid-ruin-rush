//Classes

//Sounds and music
import processing.sound.*;
SoundManager sndManager;

//Splash screen
SuperImage corendonLogo = new SuperImage();
SplashTransition splash = new SplashTransition();

//Menu
SuperText menuTitle = new SuperText();
SuperText startText = new SuperText();
SuperText highscoreText = new SuperText();

//Game
Background bg = new Background();
Player player = new Player();
GameUI gui = new GameUI();
Spawner s = new Spawner();

//System
IHighscore highscoreManager;
IActionHandler actionHandler;
IInputEventHandler inputHandler;

//Images
PImage spritesheet, enemySpritesheet;
PImage tutorialImage;
PImage roofImg;

//prefabLoader
ArrayList<PImage> prefabs = new ArrayList<PImage>();

//Blood particles
ArrayList<Blood> bloodParticles = new ArrayList<Blood>();
ArrayList<ScorePopup> scorePopupParticles = new ArrayList<ScorePopup>();

//Endscreen
SuperText endTitle = new SuperText();
SuperText backText = new SuperText();
SuperText scoreText = new SuperText();

//Member variables
float _Speed = -5;
float _DistanceRan = 0;
float _TreasureCollected = 0;
float deltaTime = 0;
float roofSpeed = -2;
float roofX = 0;
float roofY = 0;
int score = 0;
int dispScore = 0;
int highscore = 0;
Boolean _MouseReleased = false;
Boolean _GameReseted = false;
Boolean _Tutorial = true;
Boolean _MusicIsLoaded = false;

final int BLOOD_SPLASHES = 10;
final float GRAVITY = 0.5;

//Control keys
boolean jumping = false;
boolean firing, xIsPressed;
int left, right;

//Ammo lists
ArrayList<Ammo.Bullet> bullets = new ArrayList<Ammo.Bullet>();
ArrayList<Ammo.Bolt> bolts = new ArrayList<Ammo.Bolt>();
ArrayList<Ammo.ShotgunShell> shells = new ArrayList<Ammo.ShotgunShell>();

//State machine
public enum States {
  SplashScreen, 
    MainMenu, 
    Game, 
    EndScreen
};

States _GameState = States.SplashScreen;

//Weapons enum
public enum Weapons {
  Handgun, 
    Shotgun, 
    Crossbow
};

Weapons _CurWeapon;

//Setup for initializing stuff
void setup () {
  size(1280, 768);
  frameRate(60);

  loadInterfaces();

  loadHighscore();
  sndManager = new SoundManager();

  _CurWeapon = Weapons.Handgun;

  //Init for Splash stuff
  corendonLogo.set(width / 2, -200, "./Art/SplashScreen/Corendon-Logo.jpg", 1, 255);
  splash.init();
  tutorialImage = loadImage("./Art/SplashScreen/Tutorial.png");

  //Init for Menu stuff
  menuTitle.set(width / 2, 100, "Ruin Rush", 150, color(255, 255, 255), 4);
  startText.set(width / 2, height / 2, "PRESS [X] TO START\nPRESS [Z] FOR HELP", 40, color(255, 255, 255), 4);
  highscoreText.set(width / 2, 600, "Highscore\n" + highscore, 50, color(255, 255, 255), 4);

  //Init for Game stuff
  spritesheet = loadImage("./Art/spsh_PlayerPickups.png");
  enemySpritesheet = loadImage("./Art/spsh_enemies.png");
  roofImg = loadImage("./Art/Roof.png");


  bg.init();
  player.init();
  gui.init();
  s.init();

  //Init for EndScreen stuff
  endTitle.set(width / 2, 100, "YOU DIED", 150, color(255, 0, 0), 4);
  backText.set(width / 2, height / 2, "PRESS [X] TO GO BACK", 40, color(255, 255, 255), 4);
  scoreText.set(width / 2, 250, "Score: " + dispScore, 50, color(255, 255, 255), 4);

  loadPrefabs();

  if (_GameState == States.SplashScreen)
    sndManager.playSound(12);
}

private void loadInterfaces(){
  //this will probably get its own class. 
  highscoreManager = new HighscoreManager();
  
  actionHandler = new InputActionHandler();
  inputHandler = new InputEventHandler();
  inputHandler.setActionHandler(actionHandler);
}

public float distance(int x1, int x2, int y1, int y2) {
  return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
}

//Highscore 
void loadHighscore() {
  highscore = highscoreManager.loadHighscore();
}

void setHighscore(float h) {
  highscoreManager.setHighscore(h);
}

//input events have to be caught in the main sketchTab
void keyPressed(){
  inputHandler.keyPressed();
}

void keyReleased(){
  inputHandler.keyReleased();
}

void mouseReleased(){
  inputHandler.mouseReleased();
}

//Reset all data
void resetGameData() {
  //Reset speed and distance meter
  _DistanceRan = 0;
  CW = 1;
  _Speed = -5;
  _TreasureCollected = 0;
  score = 0;
  dispScore = 0;

  bullets.clear();
  bolts.clear();
  shells.clear();
  s.pickups.clear();
  s.enemies.clear();
  s.obstakels.clear();
  bloodParticles.clear();
  scorePopupParticles.clear();

  setup();

  _GameReseted = true;
}

//Update our game logic here
void updateGame() {
  switch (_GameState) {
  case SplashScreen:
    splash.update();
    break;
  case MainMenu:
    if (!_GameReseted) {
      resetGameData();
      sndManager.playSound(4);
    }

    startText.update();
    
    
    
    if (keyCode == 'X' && !keyPressed) {
      _GameState = States.Game;
      delay(500);
      sndManager.stopSound(4);
      keyCode = 10;
      sndManager.playSound(10);
    } else if (keyCode == 'Z' && !keyPressed) {
      _GameState = States.Game;
      _Tutorial = true;
      delay(500);
      sndManager.stopSound(4);
      keyCode = 10;
      sndManager.playSound(10);
    }
    break;
  case Game:
    sndManager.playSound(2);
    if (!_Tutorial) {
      player.update();
      bg.update();
      s.update();
      roofX += roofSpeed + _Speed;

      if (Math.abs(roofX) >= roofImg.width)
        roofX = 0;

      for (int i = 0; i < bloodParticles.size(); i++) {
        Blood bl = bloodParticles.get(i);
        bl.update();
      }

      for (int i = 0; i < scorePopupParticles.size(); i++) {
        ScorePopup spp = scorePopupParticles.get(i);
        spp.update();
      }

      //Update the bullets
      for (int iBullet = 0; iBullet < bullets.size(); iBullet++) {
        Ammo.Bullet aBullet = bullets.get(iBullet);
        aBullet.update();
      }

      for (int iBolts = 0; iBolts < bolts.size(); iBolts++) {
        Ammo.Bolt aBolt = bolts.get(iBolts);
        aBolt.update();
      }

      for (int iShell = 0; iShell < shells.size(); iShell++) {
        Ammo.ShotgunShell aShell = shells.get(iShell);
        aShell.update();
      }
    } else {
      if (keyCode == 'X' && !keyPressed) {
        _Tutorial = false;
        sndManager.stopSound(10);
        sndManager.playSound(10);
        keyCode = 10;
      }
    }

    gui.update();
    break;
  case EndScreen:
    sndManager.playSound(3);
    sndManager.playSound(11);
    sndManager.stopSound(2);
    _GameReseted = false;
    scoreText.t = "Score: " + dispScore;

    backText.update();

    if (keyCode == 'X' && !keyPressed) {
      _GameState = States.MainMenu;
      delay(500);
      sndManager.stopSound(3);
      keyCode = 10;
      sndManager.playSound(10);
    }
    break;
  }

  _MouseReleased = false;
}

//Draw our game here
void drawGame() {
  switch (_GameState) {
  case SplashScreen:
    background(255);
    corendonLogo.draw();
    break;
  case MainMenu:
    background(0);
    menuTitle.draw();
    highscoreText.draw();
    startText.draw();
    break;
  case Game:
    background(187, 235, 246);
    bg.draw();
    s.draw();
    player.draw();
    image(roofImg, roofX, roofY);
    image(roofImg, roofX + roofImg.width, roofY);

    //Draw the bullets
    for (Ammo.Bullet b : bullets) {
      b.draw();
    }

    for (Ammo.Bolt b : bolts) {
      b.draw();
    }

    for (Ammo.ShotgunShell s : shells) {
      s.draw();
    }

    for (Blood bl : bloodParticles)
      bl.draw();
    for (ScorePopup spp : scorePopupParticles)
      spp.draw();

    gui.draw();
    break;
  case EndScreen:
    background(0);
    endTitle.draw();
    scoreText.draw();
    highscoreText.draw();
    backText.draw();
    break;
  }
}

//The actual loop
void draw () {
  updateGame();
  drawGame();
  deltaTime = 1 / frameRate;
}
