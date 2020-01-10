class ScorePopup {
  int x, y, r, g, b;
  String text;
  float vx, vy;
  float t;

  ScorePopup(int x, int y, int sc) {
    this.x = x;
    this.y = y;

    r = (int)random (0, 255);
    g = (int)random (0, 255);
    b = (int)random (0, 255);
    
    text = "+" + sc;
    
    vx = random(-5, 5);
    vy = -random(5, 10);
    
    score += sc;
    
    t = 255;
  }
  
  ScorePopup(int x, int y, String txt) {
    this.x = x - 60;
    this.y = y;

    r = (int)random (0, 255);
    g = (int)random (0, 255);
    b = (int)random (0, 255);
    
    text = txt;
    
    vx = random(-5, 5);
    vy = -random(5, 10);
    
    t = 255;
  }

  void update() {
    vy += GRAVITY;
    
    t--;
    
    x += vx;
    y += vy;
    
    if (t <= 0)
      scorePopupParticles.remove(this);
  }
  
  void draw() {
    tint(max(t,0));
    fill (r,g,b);
    text(text, x, y);
    tint (255);
  } 
}