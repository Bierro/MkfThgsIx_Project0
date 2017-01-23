//Radius of our circle
int circleRadius = 100;
//Position of our circles
int circle1X, circle1Y, circle2X, circle2Y, circle3X, circle3Y;
//Easing percentages for the circles' movement
float easing1 = 0.1, easing2 = 0.05, easing3 = 0.02;
//Colors of the three circles
color c1 = #ba4f25, c2 = #5e6387, c3 = #2534ba;
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
  
  //Position the circle at the center of the screen on the first frame
  if (firstFrame){
    circle1X = width / 2;
    circle1Y = height / 2;
    circle2X = width / 2;
    circle2Y = height / 2;
    circle3X = width / 2;
    circle3Y = height / 2;
    
    fill(c1);
    ellipse(circle1X, circle1Y, circleRadius, circleRadius);
    fill(c2);
    ellipse(circle2X, circle2Y, circleRadius, circleRadius);
    fill(c3);
    ellipse(circle3X, circle3Y, circleRadius, circleRadius);
    
    firstFrame = false;
    return;
  }
    
  //Coordinates of the distance between the circles and the mouse
  int distance1X = mouseX - circle1X;
  int distance1Y = mouseY - circle1Y;
  int distance2X = mouseX - circle2X;
  int distance2Y = mouseY - circle2Y;
  int distance3X = mouseX - circle3X;
  int distance3Y = mouseY - circle3Y;
  
  //Move the circles closer to the cursor using the easing percentage
  circle1X += distance1X * easing1;
  circle1Y += distance1Y * easing1;
  fill(c1);
  ellipse(circle1X, circle1Y, circleRadius, circleRadius);
  circle2X += distance2X * easing2;
  circle2Y += distance2Y * easing2;
  fill(c2);
  ellipse(circle2X, circle2Y, circleRadius, circleRadius);
  circle3X += distance3X * easing3;
  circle3Y += distance3Y * easing3;
  fill(c3);
  ellipse(circle3X, circle3Y, circleRadius, circleRadius);

}