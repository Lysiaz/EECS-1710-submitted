PImage img, img1, img2;

float x = 300;
float y = 300;
float s = 150;
float speed = 5;

void setup() {
  size(1400, 700, P2D);
  
  img = loadImage("mapletree.png");
  img1 = loadImage("mapleleaf.png");
  img2 = loadImage("cute.png");
  frameRate(40);
}

void draw() {
  imageMode(CORNER);
  image(img, 0, 0, width, height);
  
  imageMode(CENTER);
  for (int i=0; i<8; i++) {
    image(img1, random(width), random(height), img.width/10, img.height/10);
}
  
  imageMode(CORNER);
  image(img2, x, y, s, s); 
  x += speed;
  
  if (x > width || x < 0) {
    speed *=-1;
  }
  
  ellipse(mouseX, mouseY, 20, 20);
  
}  
  
