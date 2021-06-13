import processing.sound.*;

/*
Minseok Kim
 Mid term project - a rhythm game
 */



final int bg = 230;
final int NUM_INSTRUMENT=4;
int score = 0;
Boolean instructionStart = false;
Boolean gameStart = false;
Boolean gameOver = false;

int num_pattern = 7;

int r = 120;
int g = 255;
int b = 0;
int r_speed = 1;
int g_speed = 1;
int b_speed = 1;

// Create an array for the music pattern
int left = 37;
int right = 39;
int up = 38;
int down = 40;

int[] patternArray = {0, 0, 0, 0, 0, 0, 0};

int sound_num = 0;
int tmp = 0;

SoundFile[] sounds;
SoundFile[] soundPattern;

Boolean buttonReady = true;
Boolean nextLevel = false;
Boolean playingSound = false;
Boolean soundShouldPlay = false;

color left_clr = color(255, 0, 0);
color right_clr = color(0, 255, 0);
color up_clr = color(0, 255, 255);
color down_clr = color(200, 0, 255);

String face = "smile";


// Start page
void startPage()
{
  background(255);

  // Display start page image
  PImage startImg = loadImage("startImage.jpg");
  image(startImg, 0, 0, width, height);

  // Title
  fill(220, 35, 15);
  textFont(loadFont("BodoniMT-Italic-80.vlw"));
  textAlign(CENTER);
  text("RHYTHM GAME", width/2, height/6);
  textFont(loadFont("Dialog.plain-30.vlw"));
  textAlign(LEFT);
  fill(100);
  text("by Minseok Kim", width*2/3 + 40, (height/4));

  // blinking "click anywhere to proceed"
  if (millis() % 2000 <= 1000)
  {
    textAlign(CENTER);
    fill(28, 234, 61);
    text("Click anywhere to proceed", width/2, height*19/20);
  }

  fill(0);

  // go to instruction
  if (mousePressed == true)
  {
    instructionStart = true;
  }
}

// Instruction page
void instructionPage()
{
  background(bg);
  PImage instructionImg = loadImage("instruction.PNG");
  image(instructionImg, 0, 0, width, height);
  drawDrum(width/(NUM_INSTRUMENT+1), height*4/(NUM_INSTRUMENT+1), width/(NUM_INSTRUMENT+1), height/(NUM_INSTRUMENT+1));

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
    textFont(loadFont("Dialog.plain-30.vlw"));
    text("Press ENTER or RETURN to start game", width/2, height/2 + 140);
  }
}

// Draw drums
void drawDrum(int x_, int y_, int w_, int h_)
{
  left_clr = color(255, 0, 0);
  right_clr = color(0, 255, 0);
  up_clr = color(0, 255, 255);
  down_clr = color(200, 0, 255);


  for (int i=0; i<NUM_INSTRUMENT; i++)
  {
    // Change the color of specific button when pressed
    if (keyPressed)
    {
      if (key == CODED)
      {
        if (keyCode == left)
        {
          left_clr = 255;
          if (buttonReady)
          {
            sounds[0].play();
          }
        } else if (keyCode == right)
        {
          right_clr = 255;
          if (buttonReady)
          {
            sounds[1].play();
          }
        } else if (keyCode == up)
        {
          up_clr = 255;
          if (buttonReady)
          {
            sounds[2].play();
          }
        } else if (keyCode == down)
        {
          down_clr = 255;
          if (buttonReady)
          {
            sounds[3].play();
          }
        }
        buttonReady = false;
      }
    }


    // Selecting colors for each buttons
    if (i==0)
    {
      fill(left_clr);
    } else if (i==1)
    {
      fill(right_clr);
    } else if (i==2)
    {
      fill(up_clr);
    } else
    {
      fill(down_clr);
    }


    // draw buttons
    ellipseMode(CENTER);
    ellipse(x_+(i*w_), y_, w_, h_);


    // arrow indication in the buttons
    fill(0);
    textFont(loadFont("FranklinGothic-Heavy-30.vlw"));
    textAlign(CENTER);
    if (i==0)
    {
      text("LEFT", x_+(i*w_), y_);
    } else if (i==1)
    {
      text("RIGHT", x_+(i*w_), y_);
    } else if (i==2)
    {
      text("UP", x_+(i*w_), y_);
    } else
    {
      text("DOWN", x_+(i*w_), y_);
    }
  }
  imageMode(CENTER);
  PImage snare = loadImage("snare.jpg");
  image(snare, x_, y_+50, w_/3, h_/3);
  PImage clap = loadImage("clap.png");
  image(clap, x_+w_, y_+50, w_/3, h_/3);
  PImage hihat = loadImage("hihat.jpg");
  image(hihat, x_+w_*2, y_+50, w_/3, h_/3);
  PImage kick = loadImage("kick.jpg");
  image(kick, x_+w_*3, y_+50, w_/3, h_/3);
  imageMode(CORNER);

  fill(0);
}

// If there is no key pressed, it is ready to press a button
void keyReleased()
{
  buttonReady=true;
}

// Checking the answer
void checkPattern()
{
  if (keyPressed && buttonReady)
  {
    if (gameStart == true && key == CODED)
    {
      // If correct
      if (keyCode == patternArray[0])
      {
        score += 1;
        face = "smile";

        // Pushing every element to the next index
        for (int i=0; i<patternArray.length-1; i++)
        {
          patternArray[i] = patternArray[i+1];
        }
        // Making the last element 0
        patternArray[patternArray.length-1] = 0;
      }

      // If incorrect, game over
      else
      {
        gameOver = true;
        face = "not smile";
      }
    }
  }
}

// Gradation in the background
void gradation()
{
  // colors between (120,255,0) and (240,0,255)
  if (r >= 120 && r <= 240) 
  {
    r += r_speed;
  } else
  {
    r_speed = -r_speed;
    r+= r_speed;
  }


  if (g >= 0 && g <= 255) 
  {
    g += g_speed;
  } else
  {
    g_speed = -g_speed;
    g+= g_speed;
  }


  if (b >= 0 && b <= 255) 
  {
    b += b_speed;
  } else
  {
    b_speed = -b_speed;
    b+= b_speed;
  }

  background(r, g, b);
}

// Draw pattern box that indicates if the answer is correct
void drawBox()
{
  fill(255);
  rectMode(CENTER);
  rect(width/2, height/3, width/2, height/2);

  // Face
  fill(0);
  rectMode(CENTER);
  rect(width/2 - 80, height/3 - 80, (width/2)/10, (height/2)/10);
  rect(width/2 + 80, height/3 - 80, (width/2)/10, (height/2)/10);

  if (face == "smile")
  {
    // Show the smiling face for correct answer
    fill(0);
    rectMode(CENTER);
    rect(width/2 + 80, height/3 + 80, (width/2)/20, (height/2)/20);
    rect(width/2 - 80, height/3 + 80, (width/2)/20, (height/2)/20);

    for (int i=1; i<8; i++)
    {
      rect(width/2 - 80 + i*((width/2)/20), height/3 + 80 + ((height/2)/20), (width/2)/20, (height/2)/20);
    }
  } else if (face == "not smile")
  {
    fill(0);
    rectMode(CENTER);
    rect(width/2 + 80, height/3 + 80+ width/20, (width/2)/20, (height/2)/20);
    rect(width/2 - 80, height/3 + 80+ width/20, (width/2)/20, (height/2)/20);

    for (int i=1; i<8; i++)
    {
      rect(width/2 - 80 + i*((width/2)/20), height/3 + 80 + ((height/2)/20), (width/2)/20, (height/2)/20);
    }
  }

  fill(0);
}

// Check if one stage is over
void checkNextLevel()
{
  int sum = 0;
  for (int i=0; i<patternArray.length; i++)
  {
    sum += patternArray[i];
  }

  if (sum == 0)
  {
    nextLevel = true;
  } else
  {
    nextLevel = false;
  }
}

// Show score
void showScore()
{
  fill(0);
  textAlign(RIGHT, TOP);
  text("SCORE: " + str(score), width-10, 10);
}

// Updating music patterns -> changing the patternArray
void updatePattern()
{
  checkNextLevel();
  if (nextLevel)
  {
    // Assign the number of sounds in the pattern
    num_pattern = int(random(8));
    while (num_pattern == 0)
    {
      num_pattern = int(random(8));
    }

    // Assign the arrow patterns
    for (int i=0; i<num_pattern; i++)
    {
      patternArray[i] = int(random(37, 41));
    }

    // Assign the sounds in the pattern according to the arrow pattern
    for (int i=0; i<num_pattern; i++)
    {
      if (patternArray[i] == left)
      {
        soundPattern[i] = sounds[0];
      } else if (patternArray[i] == right)
      {
        soundPattern[i] = sounds[1];
      } else if (patternArray[i] == up)
      {
        soundPattern[i] = sounds[2];
      } else if (patternArray[i] == down)
      {
        soundPattern[i] = sounds[3];
      }
    }
    sound_num = 0;
    soundShouldPlay = true;
    if (gameStart)
    {
      tmp = millis();
    }
    println(patternArray);///////////////////////delete later
  }
}

// Check if any sound is playing now
void checkPlayingSound()
{
  playingSound = false;
  for (int i =0; i<4; i++)
  {
    if (sounds[i].isPlaying())
    {
      playingSound = true;
    }
  }
}

// Play sound pattern
void playSound()
{
  checkPlayingSound();
  if (playingSound)
  {
    // Sound image display
    fill(255);
    rectMode(CENTER);
    rect(width/2, height/3, width/2, height/2);
    fill(0);
    PImage soundImg = loadImage("sound.png");
    image(soundImg, (width/2) - (width/4), (height/3)-(height/4), width/2, height/2);
  }

  if (soundShouldPlay == true && playingSound == false && (millis()-tmp)>=2000)
  {
    soundPattern[sound_num].play();
    sound_num += 1;
    // When all sound pattern is done playing
    if (sound_num == num_pattern)
    {
      sound_num = 0;
      soundShouldPlay = false;
    }
  } else if ((millis()-tmp)<2000)
  {
    textAlign(CENTER);
    fill(0, 255, 0);
    text("NICE!", width/2, height/2+20);
    fill(0);
  }
}


void setup()
{
  frameRate(60); 
  background(bg); 
  size(800, 800); 
  sounds = new SoundFile[4];
  soundPattern = new SoundFile[7];

  for (int i = 0; i< 4; i++) 
  {
    sounds[i] = new SoundFile( this, i + ".wav");
  }
  sounds[3].rate(0.5);

  updatePattern();
}

void draw()
{
  background(bg); 

  // Start page
  if (!instructionStart)
  {
    startPage();
  } else if (instructionStart == true && gameStart == false)
  {
    instructionPage();
  }


  // Main page
  if (gameStart == true && gameOver == false)
  {
    // Background color
    gradation(); 

    // Check for answer
    checkPattern();

    // Draw drum buttons
    drawDrum(width/(NUM_INSTRUMENT+1), height*4/(NUM_INSTRUMENT+1), width/(NUM_INSTRUMENT+1), height/(NUM_INSTRUMENT+1)); 

    // Draw the pattern box
    drawBox(); 

    // Show score
    showScore();

    // Update the current music pattern
    updatePattern();

    // Play sound when new level comes
    playSound();
  }

  // Game over
  if (gameOver)
  {
    face = "not smile";
    drawBox();
    textAlign(CENTER);
    textFont(loadFont("AgencyFB-Reg-50.vlw"));
    fill(0);
    text("GAME OVER", width/2, height*3/4);
    textFont(loadFont("AgencyFB-Reg-30.vlw"));
    text("SCORE: "+str(score), width/2, height*6/7);

    if (millis() % 2000 <= 1000)
    {
      textAlign(CENTER);
      fill(80, 30, 100);
      text("Press 'r' to go back to the starting page", width/2, height*19/20);
    }

    // go to the starting page
    if (keyPressed == true)
    {
      if (key=='r')
      {
        gameStart = false;
        gameOver = false;
        instructionStart= false;
        score = 0;


        for (int i=0; i<num_pattern; i++)
        {
          patternArray[i]=0;
        }
        sound_num = 0;
        buttonReady = true;
        nextLevel = false;
        playingSound = false;
        soundShouldPlay = false;
        face = "smile";
        updatePattern();
      }
    }
  }
}
