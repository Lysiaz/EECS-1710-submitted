PImage bg;
PFont font;
int s,min,h,d,mon,y;

int clockX, clockY;
float SRadius;
float MinRadius;
float HRadius;
float clockDiameter;
 
void setup() {
  size(500, 500);
  bg = loadImage("donut.jpg");
  stroke(255);
  int radius = min(width, height) / 2;
  SRadius = radius * 0.75;
  MinRadius = radius * 0.65;
  HRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  clockX = width / 2;
  clockY = height / 2;
}
 
void draw() {
  background(#8FDBFC);
  image(bg, 0, 0, width, height);
  s = second(); 
  min = minute();
  h = hour(); 
  d = day(); 
  mon = month(); 
  y = year(); 
  
  fill(255,255,255,160);
  noStroke();
  ellipse(clockX, clockY, clockDiameter, clockDiameter);

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
   

  stroke(0);
  strokeWeight(1);
  line(clockX, clockY, clockX + cos(s) * SRadius, clockY + sin(s) * SRadius);
  strokeWeight(2);
  line(clockX, clockY, clockX + cos(m) * MinRadius, clockY + sin(m) * MinRadius);
  strokeWeight(4);
  line(clockX, clockY, clockX + cos(h) * HRadius, clockY + sin(h) * HRadius);
   

   
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = clockX + cos(angle) * SRadius;
    float y = clockY + sin(angle) * SRadius;
    vertex(x, y);
  }
  endShape();
  fill(#e85151);
}

void clockdraw()
{
  text("12",-10,-160); 
  text("3",170,0);
  text("6",-10,190);
  text("9",-190,0);
  text(y+"-" +mon +"-" +d, -80, 120);
}
