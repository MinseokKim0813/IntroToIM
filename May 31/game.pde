/*
Minseok kim
 2021/05/27
 Simple game
 */

float speed = 1;
float acceleration = 0.1;
int x_position = round(width / 2);
int y_position = round(height / 2);
int ball_radius = 30;
int direction = 2;

void setup() {
  size(600, 600);
  background(220);
}

void draw() {
  background(220);
  rectMode(CENTER);
  fill(255);
  rect(mouseX, mouseY, 100, 20);
  circle(x_position, y_position, ball_radius);
  updateSpeed();
  bounce();
  checkGameOver();
}

void bounce() {
  if ((x_position <= mouseX+50) && (x_position >=mouseX-50) && (y_position+ball_radius >= mouseY-10) && (y_position+ball_radius <= mouseY+10)) {
    speed = -speed;
  }
  if ((x_position+ball_radius >= width) || (x_position-ball_radius<=0)) {
    direction = -direction;
  }
}


void updateSpeed() {
  y_position += speed;
  speed += acceleration;
  x_position += direction;
}

void checkGameOver() {
  if (y_position >= height) {
    textSize(30);
    textAlign(CENTER);
    fill(0);
    text("GAME OVER", width/2, height/2);
  }
}
