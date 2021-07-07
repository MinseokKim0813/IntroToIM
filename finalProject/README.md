FINAL PROJECT

The task for the final project was to build a simple program that has some communication between Arduino and Processing.
For my final project, I have programmed a simple game that uses both Processing and Arduino communicating with each other.
I have named the game "Through the Walls," since the player has to control the main character (drawn as a sqaure) to go through the walls that keep coming in order to survive.

On breadboard, I have attached 1 RGB light, 1 speaker, 1 blue digital switch, 1 red digital switch, and 1 potentiometer, all connected to Arduino Uno. By controlling the potentiometer, the player can change the y-coordinate of the square in the game, and by pressing the colored buttons, the player can change the color of the square to the color of the button pressed. In order to prevent the square to hit the wall and lose the game, the player has to keep the color of the sqaure the same as the color of the incoming wall. If their colors are the same, square can go through the wall without hitting it. In order to increase the score, the player has to control the y-coordinate of the square to collect the coins that are generated at random y-coordinate inside each wall. 

Arduino keeps reading the potentiometer and keeps sending the data to Processing via serial, so that Processing can reflect the change in y-coordinate of the square in the running game. It also keeps checking if the buttons are pressed and sends the data, so that Processing is able to change the color of the sqaure accordingly. When a button is pressed, Arduino also lights up the RGB light on the breadboard with the same colored light as the color of the pressed button to reflect which color of button has been pressed. In return, Processing sends
