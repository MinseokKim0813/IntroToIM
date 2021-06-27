/*
Minseok Kim
 2021/06/27
 Simple game of bouncing a ball with communication with Arduino
 Change platform coordinate with the potentiometer value from Arduino
 */

// Import serial
import processing.serial.*;

// Serial constants
Serial myPort;
float inByte = 0;

// Game constants
int speed = 2;
int x_position = round(width / 2);
int y_position = round(height / 2);
int ball_radius = 30;
int direction = 2;
int platformX = 300;
int platformY = 550;


// Setup function
void setup () {
  size(600, 600);
  // List all the available serial ports
  printArray(Serial.list());
  // Selecting the port (left port on my laptop)
  myPort = new Serial(this, Serial.list()[0], 9600);
  // don't generate a serialEvent() unless I get '\n'
  // because processing is too fast compared to Arduino
  myPort.bufferUntil('\n');
}

void draw () {
  background(220);
  rectMode(CENTER);
  fill(255);
  rect(platformX, platformY, 100, 20);
  circle(x_position, y_position, ball_radius);
  updateSpeed();
  bounce();
  checkGameOver();
}

// Serial function
void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');
  // Always check to make sure the string isn't empty
  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    // convert to a float
    inByte = float(inString);
    // map to the width of the screen
    inByte = map(inByte, 0, 1023, 50, width-50);
    println(inByte);
    
    // Update the x coordinate of the platform
    platformX = int(inByte);
    
    // Tell Arduino we're ready for another
    myPort.write(1 + "\n"); // could be any value
  }
}


// Game functions
void bounce() {
  // if the ball touches the platform
  if ((x_position <= platformX+50) && (x_position >=platformX-50) && (y_position+ball_radius >= platformY-10) && (y_position+ball_radius <= platformY+10)) {
    speed = -speed;
  }
  // if the ball touches the top edge of the screen
  if (y_position-ball_radius <=0)
  {
    speed = -speed;
  }
  // if the ball touches left or right edges of the screen
  if ((x_position+ball_radius >= width) || (x_position-ball_radius<=0)) {
    direction = -direction;
  }
}

void updateSpeed() {
  y_position += speed;
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
