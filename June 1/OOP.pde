/*
Minseok kim
 2021/05/31
 Simple game with OOP
 */

final float SPEED = 1;
final float ACCELERATION = 0.1;
int x_position = round(width / 2);
int y_position = round(height / 2);
final int ball_radius = 30;
int direction = 2;
int bounceCount = 1;
final int BALLNUM = 10;
int score = 0;
Boolean gameOver = false;

class Balls {

  int x_position, y_position, dir;
  float speed, acceleration;

  Balls(int x_, int y_) {
    x_position = x_;
    y_position = y_;
    dir = direction;
    speed = SPEED;
    acceleration = ACCELERATION;
  }

  void bounce() {
    if ((x_position <= mouseX+50) && (x_position >=mouseX-50) && (y_position+ball_radius >= mouseY-10) && (y_position+ball_radius <= mouseY+10) && (speed>0)) 
    {
      speed = -speed;
      if (gameOver == false)
      {
        score += 1;
      }

      if (bounceCount < ballArray.length) {
        bounceCount += 1;
      }
    }
    if ((x_position+ball_radius >= width) || (x_position-ball_radius<=0)) {
      dir = -dir;
    }
  }

  void updateSpeed() {
    y_position += speed;
    speed += acceleration;
    x_position += dir;
    fill(255);
    circle(x_position, y_position, ball_radius);
  }

  void checkGameOver() {
    if (y_position >= height) {
      textSize(30);
      textAlign(CENTER);
      fill(0);
      text("GAME OVER", width/2, height/2);
      gameOver = true;
    }

    // show score
    textSize(20);
    textAlign(CENTER);
    fill(0);
    text("SCORE: " + str(score), width - 60, 20);
  }
}


Balls[] ballArray = new Balls[BALLNUM];

void setup() {
  size(600, 600);
  background(220);

  // loop for assigning array
  for (int i=0; i<ballArray.length; i++) {
    ballArray[i] = new Balls(round(random(20, width-20)), round(random(20, height/3)));
  }
}

void draw() {
  background(220);
  rectMode(CENTER);
  fill(255);
  rect(mouseX, mouseY, 100, 20);

  for (int i=0; i<bounceCount; i++) {
    ballArray[i].updateSpeed();
    ballArray[i].bounce();
    ballArray[i].checkGameOver();
  }
}
