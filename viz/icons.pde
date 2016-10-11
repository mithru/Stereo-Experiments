int numOfIcons = 6;

PImage[] icons = new PImage[numOfIcons];

void icons() {
  for (int i = 0; i < numOfIcons; i++) {
    icons[i] = loadImage(i+".png");
  }
  imageMode(CENTER);
  background(0);
  for (int i = 0; i < 100; i++) {
    int id = int(random(6));
    int teamSize = int(random(6));
    float r = 350-teamSize*20;
    pushMatrix();
    translate(width/2, height/2);
    translate(r*cos(random(id-0.8, id)*2*PI/numOfIcons), r*sin(random(id-0.8, id)*2*PI/numOfIcons), -teamSize*100);
    tint(255, 255-teamSize*30);
    scale(0.5);
    image(icons[id], 0, 0);
    popMatrix();
  }
}