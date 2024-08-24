
float offset = 345.3542432;
int mh = 150;
int marginY = 200;
int marginX = 100;

int amount = 20;

void setup() {
  size(800, 800);
  background(#001F40);
  stroke(255);
  //fill(255);
  noFill();
  noiseDetail(2, 0.3);
  
  for (int i = 1; i <= amount; i++) {
    float y = map(i, 1, amount, marginY, height - marginY);
    mountain(y);
  }
}

void mountain(float y) {
  beginShape();
  for (int i = marginX; i < (width) / 2; i++) {    
    float v = map(i, marginX, width / 2, 0, 1);
    float h = map(noise(offset), 0, 1, -0.2, 1.3) * -lerp(0, mh - 30, v) + y;
    vertex(i, h);
    offset += v > 0.3 ? lerp(0.01, 0.03, v) : 0.015;
  }
  for (int i = (width) / 2; i < width - marginX; i++) {
    float v = map(i, (width) / 2, width - marginX, 0, 1);
    float h = map(noise(offset), 0, 1, -0.2, 1.3) * -lerp(mh - 30, 0, v) + y;
    vertex(i, h);
    offset += v < 0.3 ? lerp(0.03, 0.01, v) : 0.015;
  }
  endShape();
}

void draw() {}

void keyPressed() {
  if (keyCode == 32) {
    background(#001F40);
    stroke(255);
    //fill(255);
    noFill();
    noiseDetail(2, 0.3);
    
    for (int i = 1; i <= amount; i++) {
      float y = map(i, 1, amount, marginY, height - marginY);
      mountain(y);
    }
  }
}
