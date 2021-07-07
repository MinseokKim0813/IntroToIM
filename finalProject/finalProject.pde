/*
Minseok Kim
 2021/06/30
 Final project: going through the walls
 
 Description:
 The player needs to change the color of the character to the same color as the walls that keep coming.
 Collect coins to increase score!
 
 With Arduino, this program receives some inputs (potentiometer, digital switches)
 and sends some outputs (RGB light, speaker)
 */

// Import serial
import processing.serial.*;

// Serial constants
Serial myPort;
float potentiometer = 0;

// Page constants
final int bg = 230;
int score = 0;
Boolean instructionStart = false;
Boolean gameStart = false;
Boolean gameOver = false;

// Main character constants
int characterX = 0;
float characterY = 0;
int characterW = 0;
String characterColor = "black";

// Walls constants
int wall_num = 2;
Walls[] wallArray = new Walls[wall_num];
// Not yet ready to move wall2 until wall1 is half the screen
Boolean moveWall2 = false;
int coin_w = 50;

void setup()
{
  size(800, 800);
  background(bg);

  for (int i=0; i<wallArray.length; i++)
  {
    wallArray[i] = new Walls();
  }

  characterX = width/6;
  characterY = height/2;
  characterW = width/10;

  // List all the available serial ports
  printArray(Serial.list());

  // Selecting the port (left port on my laptop)
  myPort = new Serial(this, Serial.list()[0], 9600);

  // don't generate a serialEvent() unless I get '\n'
  // because processing is too fast compared to Arduino
  myPort.bufferUntil('\n');
}

void draw()
{
  background(bg); 

  // Start page
  if (instructionStart==false)
  {
    startPage();
  } 
  // Instruction page
  else if (instructionStart == true && gameStart == false)
  {
    instructionPage();
  }
  // Main page
  else if (gameStart == true && gameOver == false)
  {
    game();
  }

  // Game over
  if (gameOver)
  {
    // go to the starting page
    if (keyPressed == true)
    {
      if (key=='r')
      {
        gameStart = false;
        gameOver = false;
        instructionStart= false;
        score = 0;
      }
    }
  }
}

// Main game function
void game()
{
  background(0, 255, 255);
  manageWalls();
  mainCharacter();
  showScore();
}

// Main character function
void mainCharacter()
{
  // Drawing the character with changed color and y position

  rectMode(CENTER);
  // If the game just started and there has not been any button pressed in breadboard yet
  // or when the data has not yet arrived, the default color is black
  if (characterColor.equals("black"))
  {
    fill(0);
  } else if (characterColor.equals("red"))
  {
    fill(255, 0, 0);
  } else if (characterColor.equals("blue"))
  {
    fill(0, 0, 255);
  }
  rect(characterX, characterY, characterW, characterW);
  fill(0);
}

// Wall class
class Walls
{
  int x, w, speed, coin_y;
  String wall_color;
  String[] wallColorArray = {"red", "blue"};
  Boolean coinEaten = false;

  Walls()
  {
    x = width;
    w = 50;
    speed = 3;
    // wallColorArray has "red" and "blue"
    wall_color = wallColorArray[round(random(0, 1))];
    // Generate coin in random y coordinate in the wall
    coin_y = round(random(coin_w, height-coin_w));
  }

  void moveAndDraw()
  {
    x -= speed;
    // Drawing the wall
    rectMode(CENTER);
    // Color the wall accordingly
    if (wall_color == "red")
    {
      fill(255, 0, 0);
    } else if (wall_color == "blue")
    {
      fill(0, 0, 255);
    }
    rect(x, height/2, w, height);

    fill(0);

    // Drawing the coin in the wall only when coin is not eaten yet
    if (coinEaten == false)
    {
      imageMode(CENTER);
      PImage coinImg = loadImage("coin.png");
      image(coinImg, x, coin_y, coin_w, coin_w);
    }
  }

  // Check when the character hits the wall or coin
  void checkHit()
  {
    // If they hit, and their colors are not the same
    if ((characterX + characterW/2 >= x-w/2)&&((characterX-characterW/2) <= x+w/2)&&(characterColor.equals(wall_color)==false))
    {
      gameOver = true;
    }

    // If hitting the coin, increase score
    if ((characterX + characterW/2 >= x-coin_w/2)&&(characterX-characterW/2 <= x+coin_w/2)
      &&(characterY+characterW/2 >= coin_y-coin_w/2)&&(characterY-characterW/2 <= coin_y+coin_w/2)
      && (coinEaten==false))
    {
      score += 1;
      coinEaten = true;
      myPort.write(1 + "\n");
    }
  }
}

// Moving walls
void manageWalls()
{
  // If first wall is at least at the half of the width
  if (wallArray[0].x <= width/2)
  {
    moveWall2 = true;
  }

  // If not yet ready to move wall2, move only wall1
  if (moveWall2 == false)
  {
    wallArray[0].moveAndDraw();
    wallArray[0].checkHit();
  }
  // If both wall1 and wall2 are ready to move
  else
  {
    for (int i=0; i<wallArray.length; i++)
    {    
      wallArray[i].moveAndDraw();
      wallArray[i].checkHit();

      // If the wall touches the left edge of the screen, reset the properties
      if (wallArray[i].x <= 0)
      {
        wallArray[i] = new Walls();
      }
    }
  }
}


// Serial function
void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');
  // Always check to make sure the string isn't empty
  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);

    // split the string with comma and put it in the array
    // because the Arduino would print the potentiometer and color separated by a comma, as programmed
    String[] array = inString.split(",");

    // convert potentiomter reading to a float
    potentiometer = float(array[0]);

    // Save color reading from swtiches from Arduino to Processing
    characterColor = array[1];

    // Map the potentiometer reading to the height of the screen
    potentiometer = map(potentiometer, 0, 1023, characterW/2, height-characterW/2);

    // Update the y coordinate of the character
    characterY = potentiometer;

    // Tell Arduino to be ready for another
    myPort.write(0 + "\n");
  }
}


// Drawing instruction page
void instructionPage()
{
  background(bg);

  //// Display start page image
  //PImage instImg = loadImage(".jpg");////////////////////////////
  //image(instImg, 0, 0, width, height);

  // Check for the key pressed
  if (keyPressed)
  {
    if (key == ENTER || key==RETURN)
    { 
      gameStart = true;
    }
  }

  // Blinking instruction
  if (millis() % 2000 <= 1000)
  {
    textAlign(CENTER);
    fill(0);
    textFont(loadFont("Dialog.plain-30.vlw"), 30);
    text("Press ENTER or RETURN to start game", width/2, height/2 + 140);
  }
}

// Drawing start page
void startPage()
{
  background(bg);

  // Display start page image
  PImage startImg = loadImage("wall.jpg");
  image(startImg, 0, 0, width, height);

  // Title
  fill(255, 255, 0);
  textFont(loadFont("BodoniMT-Italic-80.vlw"), 80);
  textAlign(CENTER);
  text("THROUGH", width/2, height/6);
  text("THE", width/2, height*2/6);
  text("WALLS", width/2, height*3/6);
  textFont(loadFont("Dialog.plain-30.vlw"), 30);
  fill(60, 250, 255);
  text("by Minseok Kim", width/2, (height*4/6));

  // blinking "click anywhere to proceed"
  if (millis() % 2000 <= 1000)
  {
    textAlign(CENTER);
    fill(28, 234, 61);
    text("Click anywhere to proceed", width/2, height*19/20);
  }

  fill(0);

  // go to instruction page if mouse clicked
  if (mousePressed == true)
  {
    instructionStart = true;
  }
}

// Display the score
void showScore()
{
  fill(0);
  textAlign(RIGHT, TOP);
  textFont(loadFont("RepriseScriptStd-48.vlw"), 30);
  text("SCORE: " + str(score), width-10, 10);
}
