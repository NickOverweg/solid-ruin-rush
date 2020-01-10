class SplashTransition {
  float x, y, h, t, a;
  int sPos, ePos;

  void init() {
    sPos = -200;
    ePos = height / 2 - 50;

    x = width / 2;
    y = sPos;
    t = 0;
    a = 255;
  }

  void update() {
    if (t < 3.5)
      t += deltaTime;
    else
      _GameState = States.MainMenu;

    if (t < 1) {   
      h = Easing.Bounce.Out(t);
      y = sPos + (ePos - sPos) * h;
    } else if (t < 3 && t > 2) {

      a = 255 - (255 * (t - 2));
      corendonLogo.opacity = (int)a;
    }

    corendonLogo.y = y;
  }
}