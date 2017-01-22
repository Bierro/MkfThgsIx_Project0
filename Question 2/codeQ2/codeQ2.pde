void setup() {
  size(3000,2000);
  
  //Our drawing is static, no need to draw it multiple times!
  noLoop();
}

//Number of rows and columns of our grid
int nbRows = 10;
int nbCols = 20;

void draw() {
  
  //Set background color to White
  background(255, 255, 255);
  
  //Dimensions of each box of the grid
  int boxWidth = width / nbCols;
  int boxHeight = height / nbRows;
  
  //draw the grid
  stroke(0);
  for (int x = 0; x < nbCols; x++){
    line (x * boxWidth, 0, x * boxWidth, height);
  }
  for (int y = 0; y < nbRows; y++){
    line(0, y * boxHeight, width, y * boxHeight);
  }
  
  //Parameters of our circles' radiuses
  int maxR = min(boxWidth, boxHeight);
  float incrementR = maxR / (float)(nbCols * nbRows);
  
  //Impose no stroke for the following circles
  strokeWeight(0);
  
  for (int index = 0; index < nbCols * nbRows; index++){
    //The row and column the circle will be
    int rowIndex = index / nbCols;
    int colIndex = index % nbCols;
    
    //Calculate the fill value of our circles by starting with black and gradually increasing Red, then Green and then Blue
    int fillRed, fillGreen, fillBlue;
    fillBlue = max (0, index - 2 * nbCols * nbRows / 3) * 255 / (nbCols * nbRows / 3);
    if (fillBlue > 0) {
      fillRed = 255;
      fillGreen = 255;
    }
    else {
      fillGreen = max (0, index - nbCols * nbRows / 3) * 255 / (nbCols * nbRows / 3);
      if (fillGreen > 0){
        fillRed = 255;
      }
      else
        fillRed = index * 255 / (nbCols * nbRows / 3);
    }
   
    fill(fillRed, fillGreen, fillBlue);
    ellipse ((colIndex + 0.5f) * boxWidth, (rowIndex + 0.5f) * boxHeight, (index + 1) * incrementR, (index + 1) * incrementR);
  }
}