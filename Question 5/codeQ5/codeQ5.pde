
int n = 30;
float x[];
float y[];
float sx[];
float sy[];
float r[];
float h[];
boolean grow[];

void setup() {
  size(3000,2000);
  colorMode(HSB);
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
    sx[i] = random(-5,5);
    sy[i] = random(-5,5);
    h[i] = random(0,256);
    r[i] = 30;
    grow[i] = false;
  }
  x[0] = y[0] = sx[0] = sy[0] = r[0] = h[0] = 0;
  grow[0] = false;
}


void mousePressed() {
  x[0] = mouseX;
  y[0] = mouseY;
  sx[0] = 0;
  sy[0] = 0;
  grow[0] = true;
}


void draw() {
  background(0);
  for (int i=0; i < n; i++) {
    fill(h[i],255,255,150);
    ellipse(x[i],y[i],2*r[i],2*r[i]);
    x[i] += sx[i];
    y[i] += sy[i];
    if (x[i] < 0 || x[i] > width) sx[i] = -sx[i];
    if (y[i] < 0 || y[i] > height) sy[i] = -sy[i];
    if (grow[i]) r[i] += .8;
    if (r[i] > 40) { sx[i] = sy[i] = r[i] = 0; x[i] = y[i] = -100;  grow[i] = false;}
  }
  for (int i=0; i < n; i++) {
    for (int j=i+1; j < n; j++) {
      if (grow[i] == false && grow[j] == false) continue;
      if (dist(x[i],y[i],x[j],y[j]) < r[i]+r[j]) { grow[i] = grow[j] = true;  sx[i] = sx[j] = sy[i] = sy[j] = 0; }
    }
  }
    
    
 
}