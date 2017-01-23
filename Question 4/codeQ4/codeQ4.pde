//Radius of our circles
int circleRadius = 50;
//Positions of our circles
int circle1X, circle1Y, circle2X, circle2Y, circle3X, circle3Y;
//Easing percentages for the two first circles' movement
float easing1 = 0.08, easing2 = 0.12;
//Linear speed (in pixels per second) of the third circle
float speed3 = 1000;
//Colors of the three circles
color c1 = #ba4f25, c2 = #5e6387, c3 = #2534ba;
//Previous positions of the mouse (in the last 2 frames)
int prevMouseX, prevMouseY, prevMouse2X, prevMouse2Y;
//Boolean specifying if we are drawing the first frame or not
boolean firstFrame = true;

void setup() {
  size(3000,2000);
  
  //No stroke for our circles
  noStroke();
}

void draw() {
  //Clear the screen and set background color to a dark grey
  background(20, 20, 20);
  
  //Position the circles at the center of the screen on the first frame
  if (firstFrame){
    circle1X = width / 2;
    circle1Y = height / 2;
    circle2X = width / 2;
    circle2Y = height / 2;
    circle3X = width / 2;
    circle3Y = height / 2;
    
    fill(c1);
    ellipse(circle1X, circle1Y, 2 * circleRadius, 2 * circleRadius);
    fill(c2);
    ellipse(circle2X, circle2Y, 2 * circleRadius, 2 * circleRadius);
    fill(c3);
    ellipse(circle3X, circle3Y, 2 * circleRadius, 2 * circleRadius);
    
    //Initialize the previous mouse positions
    prevMouseX = mouseX;
    prevMouseY = mouseY;
    prevMouse2X = mouseX;
    prevMouse2Y = mouseY;
    
    firstFrame = false;
    return;
  }
    
  //Coordinates of the difference between the circles and the mouse
  int distance1X = mouseX - circle1X;
  int distance1Y = mouseY - circle1Y;
  int distance2X = mouseX - circle2X;
  int distance2Y = mouseY - circle2Y;
  int distance3X = mouseX - circle3X;
  int distance3Y = mouseY - circle3Y;
  //distance between circle 3 and mouse
  float distance3 = sqrt(pow(distance3X, 2) + pow(distance3Y, 2));
  
  //Move circle 1 closer to the cursor using the first easing percentage
  circle1X += distance1X * easing1;
  circle1Y += distance1Y * easing1;
  fill(c1);
  ellipse(circle1X, circle1Y, 2 * circleRadius, 2 * circleRadius);
  
  //Move circle 2 with second easing percentage only if the mouse hasn't been moving in the last 2 frames
  if (mouseX == prevMouseX && prevMouseX == prevMouse2X && mouseY == prevMouseY && prevMouseY == prevMouse2Y){
    circle2X += distance2X * easing2;
    circle2Y += distance2Y * easing2;
  }
  fill(c2);
  ellipse(circle2X, circle2Y, 2 * circleRadius, 2 * circleRadius);
  
  
  //Linear Speed for the third (blue) circle.
  if (distance3 >= circleRadius / 2){
    circle3X += (speed3 / frameRate) * (distance3X / distance3);
    circle3Y += (speed3 / frameRate) * (distance3Y / distance3);
  }
  fill(c3);
  ellipse(circle3X, circle3Y, 2 * circleRadius, 2 * circleRadius);
  
  //Update the prevous mouse position values
  prevMouse2X = prevMouseX;
  prevMouse2Y = prevMouseY;
  prevMouseX = mouseX;
  prevMouseY = mouseY;
}