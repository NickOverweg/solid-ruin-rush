class InputEventHandler implements IInputEventHandler{
  IActionHandler actionHandler;
  
  public void setActionHandler(IActionHandler a){
    actionHandler = a;
  }
  
  //keyPressed to check if a key is being pressed
  void keyPressed() {  
    if (keyCode == UP) {
      jumping = true;
    }
    if (keyCode == RIGHT) {
      right = 1;
      player.animSpeed = 5;
    }
    if (keyCode == 88 && !xIsPressed) {
      firing = true;
      xIsPressed = true;
    }
  }
  
  //keyReleased to check if a key is being released
  void keyReleased() {
    if (keyCode == UP)
      jumping = false;
    if (keyCode == RIGHT) {
      right = 0;
      player.animSpeed = 8;
    }
    if (keyCode == 88) {
      firing = false;
      xIsPressed = false;
    }
  
    //Switch weapon
    if (keyCode == 90 && _GameState == States.Game && !_Tutorial) {
      switch(_CurWeapon) {
      case Handgun:
        _CurWeapon = Weapons.Shotgun;
        sndManager.forcePlaySound(22);
        break;
      case Shotgun:
        _CurWeapon = Weapons.Crossbow;
        sndManager.forcePlaySound(21);
        break;
      case Crossbow:
        _CurWeapon = Weapons.Handgun;
        sndManager.forcePlaySound(1);
        break;
      }
    }
  }
  
  void mouseReleased () {
    _MouseReleased = true;
  }
}
