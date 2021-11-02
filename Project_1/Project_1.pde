boolean debug = true;
PVector position, target;
boolean isRunning = false;
PImage Halloween, Ghost01, Ghost02, ghostNow, Candy;
float margin = 50;

boolean isBothered = false;
int botheredMarkTime = 0;
int botheredTimeout = 3000; // Processing measures time in milliseconds
float botheredSpread = 5;

boolean isBlinking = false;
int blinkMarkTime = 0;
int blinkTimeout = 4000;
int blinkDuration = 250;

float triggerDistance1 = 100;
float triggerDistance2 = 5;
float movementSpeed = 0.08;


void setup() {
  fullScreen();
  
  position = new PVector(width/2, height/2);
  pickTarget();
  
  Halloween = loadImage("Halloween Background.jpg");
  Halloween.resize(width, height);
  
  Candy = loadImage("Candy.png");
  
  Ghost01 = loadImage("Ghost01.jpg");
  Ghost01.resize(Ghost01.width/3, Ghost01.height/3);
  Ghost02 = loadImage("Ghost02.jpg");
  Ghost02.resize(Ghost01.width, Ghost01.height);
  
  ghostNow = Ghost01;
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  imageMode(CENTER); 
}




void draw() {
  imageMode(CORNER);
  image(Halloween, 0, 0, width, height);
  
  image(Candy, mouseX, mouseY, 60, 60);
  
  PVector mousePos = new PVector(mouseX, mouseY);
  isBothered = position.dist(mousePos) < triggerDistance1;
  
  if (isBothered) {
    botheredMarkTime = millis();
    ghostNow = Ghost02; // worried expression
    position = position.lerp(target, movementSpeed).add(new PVector(random(-botheredSpread, botheredSpread), random(-botheredSpread, botheredSpread)));
    if (position.dist(target) < triggerDistance2) {
      pickTarget();
    }
  } else if (!isBothered && millis() > botheredMarkTime + botheredTimeout) {
    if (!isBlinking && millis() > blinkMarkTime + blinkTimeout) {
      isBlinking = true;
      blinkMarkTime = millis();
    } else if (isBlinking && millis() > blinkMarkTime + blinkDuration) {
      isBlinking = false;
    }

    
  }

  position.y += sin(millis()) / 2;

  image(ghostNow, position.x, position.y);

  
}

void pickTarget() {
  target = new PVector(random(margin, width-margin), random(margin, height-margin));
}
