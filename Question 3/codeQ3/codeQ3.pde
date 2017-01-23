//Radius of our circle
int circleRadius = 50;
//Position of our circle
int circleX, circleY;
//Easing percentage for the circle's movement
float easing = 0.08;
//Boolean specifying if we are drawing the first frame or not
boolean firstFrame = true;

void setup() {
  size(3000,2000);
  
  //Set fill to a dark red and no stroke
  fill(120, 0, 0);
  noStroke();
}

void draw() {
  //Clear the screen and set background color to a dark grey
  background(20, 20, 20);
  
  //Position the circle at the center of the screen on the first frame
  if (firstFrame){
    circleX = width / 2;
    circleY = height / 2;
    ellipse(circleX, circleY, 2 * circleRadius, 2 * circleRadius);
    firstFrame = false;
    return;
  }
    
  //Coordinates of the distance between the circle and the mouse
  int distanceX = mouseX - circleX;
  int distanceY = mouseY - circleY;
  
  //Move the circle closer to the cursor using the easing percentage
  circleX += distanceX * easing;
  circleY += distanceY * easing;
  ellipse(circleX, circleY, 2 * circleRadius, 2 * circleRadius);

}