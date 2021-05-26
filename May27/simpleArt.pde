/*
Minseok Kim
 2021/05/27
 simple artwork
 */


void setup() {
  size(500, 500);

  //randomly choosing background color
  int color1 = round(random(255));
  int color2 = round(random(255));
  int color3 = round(random(255));
  background(color1, color2, color3);

  //arc pattern
  for (int i=0; i<100; i++) {
    float angle1 = random(2*PI);
    float angle2 = random(2*PI);
    int x_position = round(random(width));
    int y_position = round(random(height));
    int arcColor1 = round(random(255));
    int arcColor2 = round(random(255));
    int arcColor3 = round(random(255));
    fill(arcColor1, arcColor2, arcColor3);
    noStroke();
    arc(x_position, y_position, 50, 50, angle1, angle2);
  }

  // rectangles
  for (int i=0; i<80; i++) {
    int x_position = round(random(width));
    int y_position = round(random(height));
    int w = round(random(50));
    int h = round(random(50));
    color1 = round(random(255));
    color2 = round(random(255));
    color3 = round(random(255));
    fill(color1, color2, color3);
    noStroke();
    rect(x_position, y_position, w, h);
  }

  // lines
  for (int i=0; i<50; i++) {
    int x_position = round(random(width));
    int y_position = round(random(height));
    int w = round(random(50));
    int h = round(random(50));
    color1 = round(random(255));
    color2 = round(random(255));
    color3 = round(random(255));
    stroke(color1, color2, color3);
    line(x_position, y_position, x_position-w, y_position-h);
  }
}


void draw() {
}
