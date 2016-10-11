int numOfProjects = 50;

int numOfCorners = 10;
PVector[][] points = new PVector[numOfCorners][numOfProjects];

int offset = 100;

int picID = int(random(1000));

void setup() {
  size(displayHeight, displayHeight, P3D);
  colorMode(HSB);
  //icons();
  smooth();
//camera((width/2.0)-100, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, -250, 0, 1, 0);

  stroke(255);
  strokeWeight(2);
  for (int j = 0; j < numOfProjects; j++) {
    for (int i = 0; i < numOfCorners; i++) {
      float r = random(displayHeight/5, displayHeight/2);
      points[i][j] = new PVector(r*cos(i*(2*PI)/numOfCorners), r*sin(i*(2*PI)/numOfCorners));
    }
  }
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  for (int j = 0; j < numOfProjects; j++) {
    translate(0, 0, -j*5);
    stroke(j*4, 240, 200, 100+j*2);
    //stroke(250-j*4, 150);
    for (int i = 0; i < numOfCorners; i++) {
      if (i > 0)
        line(points[i-1][j].x, points[i-1][j].y, points[i][j].x, points[i][j].y);
    }
    line(points[numOfCorners-1][j].x, points[numOfCorners-1][j].y, points[0][j].x, points[0][j].y);
  }
  popMatrix();
}

void mouseClicked() {
  if (offset<0)
    saveFrame(picID+"-L.png");
  if (offset>0)
    saveFrame(picID+"-R.png");
  offset = -offset;
  camera((width/2.0)+offset, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, -2500, 0, 1, 0);
}