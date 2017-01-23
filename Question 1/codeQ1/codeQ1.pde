void setup() {
  size(3000,2000);
  
  //Our drawing is static, no need to draw it multiple times!
  noLoop();
}

void draw() {
  //Set background color to White
  background(255, 255, 255);
  
  //Set fill to Red and Stroke to Blue (with a weight of 10)
  fill(255, 0, 0);
  stroke (0, 0, 255);
  strokeWeight(10);
  
  //Draw a circle in the middle of the screen
  ellipse(width / 2, height / 2, 300, 300);
}