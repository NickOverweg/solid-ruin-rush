//Load prefab images into the game to generate levels

//variables
//pixelsize of each loaded block
int blockSize = 40;
//positie van huidige block
int blockPosX;
int blockPosY;

//int die handmatig bijgehouden moet worden om het aantal prefabs te weten
int prefabAmount = 37;

void loadPrefabs(){
  
  for(int i=0; i < prefabAmount; i++){
    PImage aPrefab = loadImage("./Art/Prefabs/"+ i +".png");
    prefabs.add(aPrefab); 
  }
  
}

void loadPrefab(int prefabNum){
  
  PImage prefab = prefabs.get(prefabNum);
  
  //check every pixel from left to right
  for(int ix = 0; ix < prefab.width; ix++){
    //check every pixel from top to bottom
    for(int iy = 0; iy < prefab.height; iy++){
      
      //sla coordinaten van huidige ix iy op
      blockPosX =ix * blockSize + width;
      blockPosY =iy * blockSize + 120;
      
      //check voor een witte pixel
      if(prefab.get(ix, iy) == color(255, 255, 255)){
        //spawn obstakel op plek van witte pixel
        s.spawnObstakel(blockSize, blockPosX, blockPosY);
      }
      //check gele pixel
      if(prefab.get(ix, iy) == color(255, 255, 0)){
        //spawn pickup op plek van gele pixel
        s.spawnPickup(blockPosX, blockPosY);
      }      
      //check blauwe pixel
      if(prefab.get(ix, iy) == color(0, 255, 255)){
        //spawn potion op plek van blauwe pixel
        s.spawnPotion(blockPosX, blockPosY);
      }
      
      //check groene pixel
      if(prefab.get(ix, iy) == color(0, 255, 0)){
        //spawn Cammo op plek van groene pixel
        s.spawnCammo(blockPosX, blockPosY);
      }
      
      //check donkerblauwe pixel
      if(prefab.get(ix, iy) == color(0, 0, 255)){
        //spawn Sammo op plek van donkerblauwe pixel
        s.spawnSammo(blockPosX, blockPosY);
      }
      //check paarse pixel
      if(prefab.get(ix, iy) == color(150, 0, 150)){
        //spawn Juweel op plek van paarse pixel
        s.spawnJuweel(blockPosX, blockPosY);
      }
      
      //check grijze pixel
      if(prefab.get(ix, iy) == color(150, 150, 150)){
        //spawn Treasure op plek van grijze pixel
        s.spawnTreasure(blockPosX, blockPosY);
      }
      
      //check roze pixel
      if(prefab.get(ix, iy) == color(255, 0, 255)){
        //spawn enemy1 op plek van roze pixel
        s.spawnEnemy1(blockPosX, blockPosY);
      }
      //check rode pixel
      if(prefab.get(ix, iy) == color(255, 0, 5)){
        //spawn enemy2 op plek van rode pixel
        s.spawnEnemy2(blockPosX, blockPosY);
      }
      
       //check oranje pixel
      if(prefab.get(ix, iy) == color(255, 150, 0)){
        //spawn Enemy3 op plek van oranje pixel
        s.spawnEnemy3(blockPosX, blockPosY);
      } 
      //check donkergroene pixel
      if(prefab.get(ix, iy) == color(0, 100, 0)){
        //spawn magneet op plek van donkergroene pixel
        s.spawnMagneet(blockPosX, blockPosY);
      }     

      //check donkergroene pixel
      if(prefab.get(ix, iy) == color(0, 100, 0)){
        //spawn magneet op plek van donkergroene pixel
        s.spawnMagneet(blockPosX, blockPosY);
      }
    }
  }
}
