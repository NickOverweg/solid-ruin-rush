class Background {
  //Variables
  //The roof Foreground was put in the main method, couldnt draw it over the obstacles from out this class. check line 38, 121 ,299 and 375
  //for reference.
  float x, y, cloudY, cloudX, cloudSpeed, forestY, forestX, forestSpeed, pillarX, pillarY;
  PImage groundImg, cloudImg, forestImg, pillarsImg;

  void init() {
    //Initialize the image for the ground and other objects.
    groundImg = loadImage("./Art/Ground.jpg");
    cloudImg = loadImage("./Art/Background_Cloud.png");
    forestImg = loadImage("./Art/Background_Forest.png");
    pillarsImg = loadImage("./Art/Pillars.png");

    //Declare x and y
    forestY = 30;
    forestX = 0;
    forestSpeed = -2;
    
    x = 0;
    y = 640;
    
    cloudY = 10;
    cloudX = width + (cloudImg.width);
    cloudSpeed = -1;
    
    pillarX = 0;
    pillarY = 0;
    
  }

  void update() {
    //Give standard offset to the ground and other objects
    x += _Speed;
    cloudX += cloudSpeed;
    forestX += forestSpeed;
    pillarX += _Speed;

    //If the offset exceeds the img width reset its position
    //this will give an illusion of an infinite loop
    if (Math.abs(x) >= groundImg.width)
      x = 0;

    if (cloudX <= 0 - cloudImg.width)
      cloudX = width + (cloudImg.width);

    if (Math.abs(forestX) >= forestImg.width)
      forestX = 0;
      
    if (Math.abs(pillarX) >= pillarsImg.width)
        pillarX = 0;

  }

  void draw () {
    //Draw the ground on the x and all other objects on their respective x axis'
    image(cloudImg, cloudX, cloudY);
    image(forestImg, forestX, forestY);
    image(forestImg, forestX + forestImg.width, forestY);
    image(pillarsImg, pillarX, pillarY);
    image(pillarsImg, pillarX + pillarsImg.width, pillarY);
    image(groundImg, x, y);
    image(groundImg, x + groundImg.width, y);     
  }
}