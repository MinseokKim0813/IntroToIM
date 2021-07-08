2021/06/29

The preliminary concepts for the final project have been brainstormed. The program must include at least 4 topics each that have been covered in Processing and Arduino; they must have some communication between each other. After a thoughtful process of brainstorming and research for creative game ideas, I have come up with an idea of something similar to the snake game in Google; in the Google snake game, the snake has to keep eating the apple without hitting the edge of the screen as the snake gets longer when eating the apple. Inspired from this game, I came up with a new game with some significant changes from the snake game. Below is the picture of the snake game where I got inspiration from.

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/finalProject/reference/snakeGame.png?raw=true)

In the game that I came up with, the main character needs to go through the walls that keep generating and moving closer to the character. The walls are randomly colored with select colors, and the character would have to change its color to the same color as the color of the incoming wall to go through the wall. I am planning to enable the character to change its color by pressing differently colored digital switches (buttons) connected to Arduino. Plus, there would be coins between every two walls and the coins would increase the score of the player. However, the coins would be at random y-coordinates, and in order to change the y-coordinate of the character, the player would have to control the potentiometer. All these inputs from potentiometer and switches would be sent to Processing and received in the game. Plus, when the score increases as the player collects coins, the sound would play and LED would blink to inform the players. Below is the draft of the game design that I drew on paper.

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/finalProject/reference/gameSketch.jpg?raw=true)

From now, I would start thinking about the details of the game, since I only have a vague idea about it. For example, I would start thinking about the program algorithmically for Processing and Arduino.

2021/06/30

Today, I have added the specific details about the final project. On the breadboard, there would be 3 buttons; unlike the initial thought, the speed of the walls would not increase as the difficulty of the game is already quite high as the player needs to control 2 different kinds of inputs on the breadboard. Since there are multiple input devices for the player, the buttons and the potentiometer would have to be easy to control - for example, they would need to have enough distance from the wires.

In Processing, I have created the start page where the title and my name displays. Since the game is about going through as many walls as possible and getting higher score, I have put an image of a wall and decided the name of the game as "Through the Walls". 

Below is the starting page of the program. I created a folder for citation; the reference for the image of the background wall has been saved in that file.

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/finalProject/reference/startingPageImg.PNG?raw=true)

The plan remains pretty much the same, and thanks to the details of the project that I have decided, I have a clearer idea of how my game would look llke. From now, I would start programming on Processing for the instruction page and game page.

2021/07/01

I have made a few changes in the plan today. After reviewing the difficulty of the game and my ability to create a complex game, I have decided that the game should be a little more fun. Initially I planned to implement 3 digital switches that have different colors, but it would be too difficult for the players when they also have to control the potentiometer with the other hand. Plus, to make up for this reduction in difficulty, I would also increase the speed of the walls coming towards the character as the time passes. 

Today, I have completed creating the instruction page and got started with the game page. After coding for the starting page yesterday, I realized that it is a big inconvenience to code for every single text, especially for the fonts, font sizes and x and y coordinates for the texts. Therefore, for the instruction page, I decided to use the image of a page in the Word file where I will have already written all the instruction. That way, I would be able to save much more time without losing any details. Therefore, I have left the instruction page empty for now and proceeded to the main game page.

In the game page, I started with a function that changes the background of the page. Since it is aesthetically pleasing, I am going to use a gradation function, which keeps changing the background color consistently between 2 colors. Since I have learned it before in one of the classes, it would not be so hard to implement it. 

Although there has been a slight change in the initial plan, it would not affect the outcome of the project drastically. My next step would be continuing programming on Processing for the game page.

2021/07/02

Today, I completed the gradatino function in the game page. There has not been any difficulty in implementing it. Below is the screenshot of the game page. Although it cannot be seen from the screenshot, the background color keeps changing.

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/finalProject/reference/gradation.PNG?raw=true)

However, as I started algorithmically thinking about each feature of the whole game, the challenge in enabling the communication between Arduino and Processing started concerning me. While I am quite confident in programming on Processing, I am worried that I may not be able to implement the serial communication between Arduino and Processing, since I have been having a relatively hard time understanding the concept of the serial communication completely. Before starting to program for the important functions in the game page, I would now study and revise the serial communication and understand them completely.

2021/07/04

I have revised the lectures from the class for seiral communication between Arduino and Processing. I was able to finally understand the concept and syntax of the communication. It was quite hard, but I understand that since it will be the core of the program I am making, so it must have the importance among other features. It was particularly harder to understand, because I could not see what is going on in the serial monitor while I am running a processing program. So the process of running the program in my head was challenging for me. However, now that I understand how to implement the feature, I could finally use it for my program. Once the communication is complete, the rest of the features would be easier to implement compared to the communication feature. Therefore, from now on, I am going to start implementing the serial communication between Arduino and Processing.

2021/07/05

Today, I have made a big progress on my program. I realized that I am a little behind the schedule for the deadline, so I decided to spend more time on this project. Thus, from today, I am putting the other final project aside and keeping this project as the priority. 

In the Processing program, I realized that I would not need a gradation function. Since my game involves using colors, I noticed that the gradation in the background would disturb the focus of the player or visually confusing to the players. After deleting the gradation function, I worked on Arduino program and breadboard. I have completed the circuit for a RGB light, a speaker, 1 red and 1 blue buttons, and a potentiometer. Although I had forgotten how to build the circuit for most of the components, after revising the lectures, it was not at all challenging to build the circuit on the breadboard.

Below is the picture of the circuit.

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/finalProject/reference/circuitPicture.jpg?raw=true)

In Arduino program, I have so far completed coding for the 2 buttons and potentiometer. I have not bumped into any error or difficulty while working on them yet. In Processign program, I have made functions for drawing and moving the y coordinate of the square (main character). As I have learned in the class, I have mapped the reading of the potentiometer to the height of the screen in the Processing code so the reading of the potentiometer is capped at the bottom and top of the screen in the Processing program. Arduino sends the reading for the potentiometer when it receives data on the serial from Processing, and Processing also sends the data after reflecting the data received from Arduino, every time it receives a data from Arduino. Below is a screenshot of the Processing program. I have put a background image of a forest after removing the gradation function.

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/finalProject/reference/square.PNG?raw=true)

However, I have not figured out a way to send the data for the pressed buttons from Arduino to Processing yet. I have only worked with sending only one type of data from Arduino to Processing before, so I am currently working to figure out how to send two different data separately. Although I am stuck on this task for now, I feel that it won't be for long, and since the progress stays on trach for the due date, I am going fine for the overall progress of the project. I will try to figure this task by tomorrow.

2021/07/06

I have figured out a way to solve the problem I faced yesterday: how to send two different data from Arduino to Processing. It was much simpler than I thought. I created a boolean flag for the red and blue buttons each, and sent the value together with the data from the reading of the potentiometer. I stored the color in a String variable "color" and sent it to Processing as below. Whenever a button is pressed, its color is stored in the variable 'color'.

```java
// Sending the data for potentiometer input and colored button input to Processing
Serial.println(String(analogRead(potentiometer)) + "," + color);
```

After checking that it successfully sends the data to Processing, I faced another problem. As I tried changing the color of the square in Processing according to the color data received by Arduino, Processing always seemed to recognize the color. Below was the code block I used for red color.

```java
if (characterColor == "red")
  {
    fill(255, 0, 0);
  }
```

After a few 'println' statements and research on the internet, I finally figured out that when comparing two string variables, I have to use '.equals()' function instead of '=='. Apparently, '.equals()' function only checks the string value of the variable while '==' checks if two variables are exactly same, including the reference number in the memory. It was interesting to know that Java also had two different functions for comparing string variables like Python. Below is the code block that I fixed.

```java
if (characterColor.equals("red"))
  {
    fill(255, 0, 0);
  }
```

Plus, I have also completed implementing the RGB light on Arduino program. Whenever a button is pressed, RGB light gets turned on with the color same as that of the pressed button. I have used 'millis()' function instead of 'delay()' function to avoid ceasing the program while waiting for the light to turn off. The light gets turned off after 1 second. Below is the code block for the RGB light function for red button.

```java
  // If red button is pressed, the color is "red"
  if (redButtonPressed == HIGH)
  {
    color = "red";
    // Indicate the color with LED
    temp = millis();
    digitalWrite(redLED,HIGH);
  }
  
  // Turn off LED light after 1 second
  if (millis() - temp >= 1000)
  {
    digitalWrite(blueLED,LOW);
    digitalWrite(redLED,LOW);
  }
```

As I have made a lot of progress today, I am on track. The remaining tasks are implementing walls, coins, speaker, score and game over page. The most challenging task would be how to make enable Arduino to receive the data from Processing, making the communication both ways. I have only worked with sending data from Arduino to Processing, so I have not figured out how to accomplish this task yet. From now, I am going to revise the lectures again to figure it out.

2021/07/07

My program has been finally completed. I have asked the professor about the communication in both ways between Arduino and Processing. He provided me a clear answer for it with details, so I was able to understand the concept completely. Before asking him, I tried directly sending the data from Processing to Arduino, like I did before to send an arbitrary data to Arduino to keep the communication going. Below is the code block I used in Processing program for checking if the square collected a coin.

```java
    // If hitting the coin, increase score
    if (! gameOver)
    {
      if ((characterX + characterW/2 >= x-coin_w/2)&&(characterX-characterW/2 <= x+coin_w/2)
        &&(characterY+characterW/2 >= coin_y-coin_w/2)&&(characterY-characterW/2 <= coin_y+coin_w/2)
        && (coinEaten==false))
      {
        score += 1;
        coinEaten = true;
        myPort.write(1);
      }
    }
```

However, although it worked most of the times, it seemed to not work occasionally and eventually freeze the communication between Arduino and Processing programs. However, as the professor explained, I was breaking the handshaking between the two programs by only writing 'myPort.write(1);'. As he suggested, after storing the value to send in a new variable and sending them later in the code block where handshaking occurs solved the problem. It felt great to understand the challenging concept I got stuck on and see the program working! Below is the code block in Processing where handshaking and serial communication happends.

```java
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
    myPort.write(dataToSend + "\n");
    dataToSend = 0;
  }
}
```

Once this problem was solved, the rest of the parts were easy as I have already implemented similar features before. I created a function for generating walls using Object Oriented Programming (walls as objects). I initially thought of using an array to store infinitely generating walls as time passes but soon thought of another less memory-consuming way of implementing it. I created an array for 2 walls and kept resetting the wall that the square has passed through, so that the wall that as soon as a wall moves out of the screen, it comes back to the initial position with the random color and coin location. However, the speed of the walls was kept in global variable and has been shared among all walls as it needed to keep increasing as time passes. Below is the code block where resetting wall properties occur. The boolean variable 'moveWall2' was created to start moving the second wall half a screen apart from the first wall.

```java
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
    wallArray[0].checkHit();
    wallArray[0].moveAndDraw();
  }
  // If both wall1 and wall2 are ready to move
  else
  {
    for (int i=0; i<wallArray.length; i++)
    {    
      wallArray[i].moveAndDraw();
      wallArray[i].checkHit();

      // If the wall touches the left edge of the screen, reset the properties (make a new one from right edge)
      if (wallArray[i].x <= 0)
      {
        wallArray[i] = new Walls();
      }
    }
  }
}
```

And below is the screenshot of the Processing program with walls.

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/finalProject/reference/walls.PNG?raw=true)

I created the coin as a property of a wall, since every wall has a coin inside itself. Whenever a coin is collected, the speaker needed to play a tone. Since I already figured out how to send the data from Processing to Arduino, I only needed to receive the sent data in Arduino program. As the professor suggested, I used 'Serial.parseInt()' to receive the integer data from Processing program. I sent 1 whenever a coin is collected. Below is the Arduino code block for receiving the data.

```java
// Processing sends data of coinEaten as "1" (boolean but transferred as integer)
coinEaten = Serial.parseInt();
```

Lastly, the game over function was much easier to implement commpared to other functions. I created a boolean variable 'gameOver' and checked if it is true. whenever the square hits the wall with different color, the variable becomes true. Then, all I needed to do was just display the texts and score and let the player choose to play again. Below is the code block for game over page. In the end, I also wrote the instruction that I left blank earlier on Word document and took a screenshot, then I put it in the instruction page in Processing program as an image.

```java
// Game over
  if (gameOver)
  {
    // Display "game over" and score
    background(0, 255, 150);
    textAlign(CENTER);
    fill(0);
    textFont(loadFont("Dialog.plain-30.vlw"), 50);
    text("OOPS, GAME OVER!", width/2, height/3);
    fill(255, 150, 0);
    textFont(loadFont("Dialog.plain-30.vlw"), 40);
    text("SCORE: " + score, width/2, height*3/5);
    fill(0);

    // Blinking instruction to play again
    if (millis() % 2000 <= 1000)
    {
      fill(255, 255, 0);
      textFont(loadFont("Dialog.plain-30.vlw"), 30);
      text("Play again by pressing 'r'", width/2, height*4/5);
    }

    // Go back to the starting page to play again
    if (keyPressed == true)
    {
      if (key=='r')
      {
        gameStart = false;
        gameOver = false;
        instructionStart= false;
        score = 0;
        moveWall2 = false;
        dataToSend = 0;
        wallSpeed = 5;
        for (int i=0; i<wallArray.length; i++)
        {
          wallArray[i] = new Walls();
        }
      }
    }
  }
```

And below is the screenshot of the game over page.

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/finalProject/reference/gameOver.PNG?raw=true)

And below is the screenshot of the instruction page.

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/finalProject/reference/instruction.PNG?raw=true)

I have written 'README.md' and finally finished implementing every feature of the program as I planned in the beginning. To reflect, I evaluate my project as a success. Most importantly, I have learned a lot while working on the project, such as the properties of String variables in Java, two-way communication between Arduino and Processing, and how to reuse an object and avoid making them infinite times. I have faced several challenges, but I was able to soon figure out a way out, and the lecture notes and directly asking the professor helped me the most. It was also fun to work on such a big, a week-long-project; I feel that I have grown a little as a programmer and an academic. In the future and in the next such project, I would try to assign each day with tasks to be completed, and plan the schedule much ahead of the deadline, so that even if I run into a problem, I would have enough time to solve it.
