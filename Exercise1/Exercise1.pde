color bgColor = color(66, 0, 25);
float posX, posY;
String message = "Hey, Exercise 1.";

void setup() {
  size(800, 600, P2D);
  ellipseMode(CENTER);
  frameRate(80);
  background(bgColor);
}

void draw() {
  fill(random(0, 255), random(0, 255), random(0, 255));
  stroke(235, 0, 214);
  ellipse(mouseX, mouseY, 10, 10);
  
  println(mousePressed);
  if (mousePressed && (mouseButton == LEFT)) {
    rectMode(CENTER);
    fill(156, 0, 255);
    stroke(0, 189, 237);
    line(mouseX, mouseY, pmouseX, pmouseY);
  } else if (mousePressed && (mouseButton == RIGHT)) {
      text(message, mouseX, mouseY);
      
      
  }
      
 
}
