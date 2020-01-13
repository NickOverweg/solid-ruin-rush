public class GameObject implements IGameObject{
  
  public GameObject(){
    
  }
  
  private Boolean isEnabled;
  
  public void destroyObject(){
    //remove object from any lists it might be on. 

  }
  
  public void draw(){
    //draws object to screen
  }
  
  public void update(){
    //runs relevant updatable logic
  }
  
  public void setEnabled(Boolean enabled){
    isEnabled = enabled;
  }
  
  public Boolean isEnabled(){
    return isEnabled;
  }
}
