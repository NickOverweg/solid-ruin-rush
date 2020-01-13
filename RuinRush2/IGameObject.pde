interface IGameObject{
  
  public void draw();
  public void update();
  
  public void setEnabled(Boolean enabled);
  public Boolean isEnabled();
  
  public void destroyObject();
}
