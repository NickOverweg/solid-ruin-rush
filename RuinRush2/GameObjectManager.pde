public class GameObjectManager implements IGameObjectManager{
  ArrayList<IGameObject> gameObjects;
  ArrayList<IGameObject> removableObjects;
  
  GameObjectManager(){
    gameObjects = new ArrayList<IGameObject>();
    removableObjects = new ArrayList<IGameObject>();
  }
  
  //this should probably be hidden from other objects, but I need to call it from outside of this class.
  public void updateObjects(){
    //Processing doesn't allow lambda's
    //gameObjects.forEach((gObject) -> gObject.update());
    
    for(IGameObject gObject : gameObjects){
      gObject.update();
    } 
  }
  
  //this should probably be hidden from other objects, but I need to call it from outside of this class.
  public void drawObjects(){
    for(IGameObject gObject : gameObjects){
      gObject.update();
    }
  }
  
  public void registerObject(IGameObject newObject){
    gameObjects.add(gameObjects.size(),newObject);
  }
  
  public void removeObject(IGameObject deleteMe){
    removableObjects.add(removableObjects.size(), deleteMe);
  }
  
  public void clearRemovedObjects(){
    for(IGameObject gObject : removableObjects){
      gameObjects.remove(gObject);
    }
  }
}
