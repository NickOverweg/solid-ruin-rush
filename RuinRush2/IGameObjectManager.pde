interface IGameObjectManager{ 
  public void updateObjects();
  public void drawObjects();
  public void registerObject(IGameObject newObject);
  public void removeObject(IGameObject deleteMe);
}
