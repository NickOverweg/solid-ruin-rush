//deze class regelt level logica
class Spawner {
  //variabelen aanmaken
  ArrayList<Pickup> pickups = new ArrayList<Pickup>();
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  ArrayList<Obstakel> obstakels = new ArrayList<Obstakel>();
  ArrayList<Object> removeme = new ArrayList<Object>();

  //used to keep track of when to spawn things
  int spawnSmall;
  int spawnBig;
  int tutorial;

  //zet arraycounters op 0
  void init() {
    spawnSmall = 15;
    spawnBig = 500;
    tutorial = 0;
  }


  //when to spawn what 
  void checkSpawn() {
    
    
    if ( _DistanceRan > spawnSmall ) {
      spawnSmall = (int) _DistanceRan;
      spawnSmall += 25 + (int) random(25);
      if(tutorial < 5){
        loadPrefab(tutorial);
        tutorial++;
      }else{
      int r = (int) random(prefabAmount);
      if(r < 5){
        r += 5;    //not-so elegant way to ensure tutorial levels only come once.
      }
      loadPrefab(r);
      }
    }
  }

  //spawn-methodes om de verschillende objecten te spawnen.
  void spawnPickup() {
    Pickup aPickup = new Pickup();
    aPickup.init();
    pickups.add(aPickup);
  }
  
  void spawnMagneet(int xSpawn, int ySpawn) {
    Pickup aMagneet = new Magneet();
    aMagneet.init();
    aMagneet.x = xSpawn;
    aMagneet.y = ySpawn - 30;
    pickups.add(aMagneet);
  }
  
  void spawnPickup(int xSpawn, int ySpawn) {
    Pickup aPickup = new Pickup();
    aPickup.init();
    aPickup.x = xSpawn;
    aPickup.y = ySpawn - 30;
    pickups.add(aPickup);
  }

  void spawnPotion() {
    Potion aPotion = new Potion();
    aPotion.init();
    pickups.add(aPotion);
  }

  void spawnPotion(int xSpawn, int ySpawn) {
    Pickup aPotion = new Potion();
    aPotion.init();
    aPotion.x = xSpawn;
    aPotion.y = ySpawn;
    pickups.add(aPotion);
  }

  void spawnEnemy1(int xSpawn, int ySpawn) {
    Enemy anEnemy = new Enemy1();
    anEnemy.init();
    anEnemy.x = xSpawn;
    anEnemy.y = ySpawn;
    enemies.add(anEnemy);
  }
  
  void spawnEnemy2(int xSpawn, int ySpawn) {
    Enemy anEnemy = new Enemy2();
    anEnemy.init();
    anEnemy.x = xSpawn;
    anEnemy.y = ySpawn;
    enemies.add(anEnemy);
  }
  void spawnEnemy3() {
    Enemy anEnemy = new Enemy3();
    anEnemy.init();
    anEnemy.x = width + 100;
    enemies.add(anEnemy);
  }

  void spawnEnemy3(int xSpawn, int ySpawn) {
    Enemy anEnemy = new Enemy3();
    anEnemy.init();
    anEnemy.x = xSpawn;
    anEnemy.y = ySpawn;
    enemies.add(anEnemy);
  }
  
  void spawnObstakel(int size, int xSpawn, int ySpawn) {
    Obstakel anObstakel = new Obstakel();
    anObstakel.init(size, xSpawn, ySpawn);
    anObstakel.x = xSpawn;
    anObstakel.y = ySpawn;
    obstakels.add(anObstakel);
    
  }

  void spawnTreasure(int xSpawn, int ySpawn) {
    Pickup aTreasure = new Treasures();
    aTreasure.init();
    aTreasure.x = xSpawn;
    aTreasure.y = ySpawn;
    pickups.add(aTreasure);
  }
  
  void spawnJuweel(int xSpawn, int ySpawn) {
    Pickup aJuweel = new Juweel();
    aJuweel.init();
    aJuweel.x = xSpawn;
    aJuweel.y = ySpawn;
    pickups.add(aJuweel);
  }
  
  void spawnSammo(int xSpawn, int ySpawn) {
    Pickup aSammo = new Sammo();
    aSammo.init();
    aSammo.x = xSpawn;
    aSammo.y = ySpawn - aSammo.size;
    pickups.add(aSammo);
  }
  
  void spawnCammo(int xSpawn, int ySpawn) {
    Pickup aCammo = new Cammo();
    aCammo.init();
    aCammo.x = xSpawn;
    aCammo.y = ySpawn - aCammo.size;
    pickups.add(aCammo);
  }
  
  //update alle objecten die de Spawner beheerd
  void update() {    
    checkSpawn();
    
    for (Pickup p : pickups) {
      p.update();
    }
    for (Enemy e : enemies) {
      e.update();
    }
    for (Obstakel o : obstakels) {
      o.update();
    }
    
    for (Object o: removeme){
      if(o instanceof Pickup){
        pickups.remove(o);
      }
      if(o instanceof Enemy){
        enemies.remove(o);
      }
      if(o instanceof Obstakel){
        obstakels.remove(o);
      }
    }
  }
  
  void draw(){
    for (Pickup p : pickups) {
      p.draw();
    }
    for (Enemy e : enemies) {
      e.draw();
    }
    for (Obstakel o : obstakels) {
      o.draw();
    } 
  }
}