
//Number of circles evolving on the screen
int n = 30;
//Positions of our circles
float x[], y[];
//Delta positions of our circles
float sx[], sy[];
//Radiuses of the circles
float r[];
//Hue of the circles
float h[];
//Booleans storing if the circles are growing
boolean grow[];
//Maximum horizontal (and vertical) speed
float maxSpeed = 5;
//Default radius of our circles
float defaultRadius = 30;
//Maximum radius when grown
float maxRadius = 80;
//Increments in radius
float radiusIncrement = 1.2;
//Saturation of our circles
float defaultSaturation = 150;
//Value of our circles
float defaultValue = 255;

void setup() {
  size(3000,2000);
  
  colorMode(HSB);
  
  resetCircles();
}

//Initialize all our arrays
void resetCircles() {
  x = new float[n];
  y = new float[n];
  sx = new float[n];
  sy = new float[n];
  h = new float[n];
  r = new float[n];
  grow = new boolean[n];
  for (int i=1; i < n; i++) {
    x[i] = random(0,width);
    y[i] = random(0,height);
    sx[i] = random(-maxSpeed, maxSpeed);
    sy[i] = random(-maxSpeed, maxSpeed);
    h[i] = random(0,256);
    r[i] = defaultRadius;
    grow[i] = false;
  }
  x[0] = y[0] = sx[0] = sy[0] = r[0] = h[0] = 0;
  grow[0] = false;
}

//Have a circle grow at the cursor position if the mouse is pressed
void mousePressed() {
  x[0] = mouseX;
  y[0] = mouseY;
  sx[0] = 0;
  sy[0] = 0;
  grow[0] = true;
}


void draw() {
  //Clear the screen and set background color to a dark grey
  background(20, 20, 20);
  
  for (int i=0; i < n; i++) {
    //Draw all our circles
    fill(h[i], defaultSaturation, defaultValue);
    ellipse(x[i],y[i],2*r[i],2*r[i]);
    
    //Update their new position
    x[i] += sx[i];
    y[i] += sy[i];
    
    //Have the circles bounce if they reach the extents of the screen
    if (x[i] < 0 || x[i] > width) sx[i] = -sx[i];
    if (y[i] < 0 || y[i] > height) sy[i] = -sy[i];
    
    //Increase the radius of the growing circles
    if (grow[i]) r[i] += radiusIncrement;
    
    //If they reached the maximum radius
    if (r[i] > maxRadius) { sx[i] = sy[i] = r[i] = 0; x[i] = y[i] = -100;  grow[i] = false;}
  }
  
  //Handle Collision between 2 circles where at least one of them is growing
  for (int i=0; i < n; i++) {
    for (int j=i+1; j < n; j++) {
      if (grow[i] == false && grow[j] == false) continue;
      if (dist(x[i],y[i],x[j],y[j]) < r[i]+r[j]) { grow[i] = grow[j] = true;  sx[i] = sx[j] = sy[i] = sy[j] = 0; }
    }
  }
    
    
 
}