class InputActionHandler implements IActionHandler{
  //up
  public void jump(Boolean setPressed){
    if(setPressed){//onPress
      jumping = true;
    }else{         //onRelease
      jumping = false;
    }
  }
  
  //forward
  public void run(Boolean setPressed){
    if(setPressed){//onPress
      right = 1;
      player.animSpeed = 5;
    }else{         //onRelease
      right = 0;
      player.animSpeed = 8;
    }
  }
  
  //X
  public void shoot(Boolean setPressed){
    if(setPressed){//onPress
      if(xIsPressed) return;
      firing = true;
      xIsPressed = true; 
    }else{         //onRelease
      firing = false;
      xIsPressed = false;
    }  
  }
  
  //Z
  public void swapWeapon(Boolean setPressed){
    if(setPressed){
      //unused
    }else{
      if(_GameState == States.Game && !_Tutorial){
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
  }
  
  public void releaseMouse(){
    _MouseReleased = true;
  }
}
