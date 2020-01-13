class InputEventHandler implements IInputEventHandler{
  IActionHandler actionHandler;
  
  public void setActionHandler(IActionHandler a){
    actionHandler = a;
  }
  
  //keyPressed to check if a key is being pressed
  public void keyPressed() {  
    if(actionHandler == null) return;
    
    informActionHandler(true);
  }
  
  //keyReleased to check if a key is being released
  public void keyReleased() {
    if(actionHandler == null) return; 
  
    informActionHandler(false);
  }
  
  public void mouseReleased () {
    actionHandler.releaseMouse();
  }
  
  private void informActionHandler(Boolean Pressed){
    switch(keyCode){
      case UP:
        actionHandler.jump(Pressed);
        break;
      case RIGHT:
        actionHandler.run(Pressed);
        break;
      case 88: //x
        actionHandler.shoot(Pressed);
        break;
      case 90: //z
        actionHandler.swapWeapon(Pressed);
    }
  }
}
