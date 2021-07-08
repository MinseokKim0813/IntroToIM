FINAL PROJECT

PROJECT DESCRIPTION:

The task for the final project was to build a simple program that has some communication between Arduino and Processing.
For my final project, I have programmed a simple game that uses both Processing and Arduino communicating with each other.
I have named the game "Through the Walls," since the player has to control the main character (drawn as a sqaure) to go through the walls that keep coming in order to survive.

On breadboard, I have attached 1 RGB light, 1 speaker, 1 blue digital switch, 1 red digital switch, and 1 potentiometer, all connected to Arduino Uno. By controlling the potentiometer, the player can change the y-coordinate of the square in the game, and by pressing the colored buttons, the player can change the color of the square to the color of the button pressed. In order to prevent the square to hit the wall and lose the game, the player has to keep the color of the sqaure the same as the color of the incoming wall. If their colors are the same, square can go through the wall without hitting it. In order to increase the score, the player has to control the y-coordinate of the square to collect the coins that are generated at random y-coordinate inside each wall. 

Arduino keeps reading the potentiometer and keeps sending the data to Processing via serial, so that Processing can reflect the change in y-coordinate of the square in the running game. It also keeps checking if the buttons are pressed and sends the data, so that Processing is able to change the color of the sqaure accordingly. When a button is pressed, Arduino also lights up the RGB light on the breadboard with the same colored light as the color of the pressed button to reflect which color of button has been pressed. In return, Processing sends the data when the square collects a coin to Arduino, so that the loud speaker plays a tone every time the square collects a coin.


PROGRAM DESCRIPTION:

Upon running the game, starting page of the game is displayed with the title and my name (developer's name). Clicking anywhere on the screen would proceed the program to the next page. Then, in the next page, instruction on how to play the game is displayed. Pressing ENTER or RETURN key would start the game. When the game starts, the square is initially colored white, and the walls start to be generated and keep coming towards the square. The player can change the y-coordinate and color of the square by controlling the buttons and potentiometer in the breadboard. The player needs to keep the color the same as the wall until the square goes through the wall completely. The speed of the walls increases linearly as the time passes to make the game more difficult and fun. Upon detecting that the square has touched the wall with different color, the game ends instantly, and the game over screen is displayed with the final score. Pressing 'r' key on keyboard proceeds the program back to the starting page to enable the player to play the game again.


NOTICE:

1. The reading of the potentiometer gets a slight deviation from the true reading when a button is pressed, and gets little more disturbance when the loud speaker is turned on as the square collects the coin. However, this disturbance does not affect playing of the game.
2. It takes a little time to get the data from Arduino and reflect it on the game on the Processing's end, skipping the starting page and instruction page and proceeding to the game instantly displays the y-coordinate of the square at the middle of the height of the screen and and not at the y-coordinate determined by the potentiometer. Empirically, this process takes roughly 1 seconds, so spending at least 1 second in total in the starting page and instruction page before proceeding to the start of the game is recommended.
3. The player must wait until the square has completely gone through the wall before changing to a different color. If the color of the square changes to a color different from that of the wall that the square is inside, it is detected as hitting the wall. Therefore, the color of the square must match the color of the wall throughout the time that the square and the wall share any pixel in order to avoid getting the game over.


APPENDICES:

Below is the schematics for the circuit on the breadboard connected to Arduino:
![](https://github.com/MinseokKim0813/IntroToIM/blob/main/finalProject/reference/schematics.png?raw=true)

Below is the picture of the circuit:
![](https://github.com/MinseokKim0813/IntroToIM/blob/main/finalProject/reference/circuitPicture.jpg?raw=true)

Here is the link to a short video of the gameplay: https://drive.google.com/file/d/1lONowkkBon_WBdnM309tvjP4HeEj8QFR/view?usp=sharing



**All the reflections, progress, code snippets, challenges faced have been written in 'journal.md' in the same directory; citation has been uploaded in 'citation.docx' in the 'reference' directory.**
