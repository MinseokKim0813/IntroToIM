2021/06/29

The preliminary concepts for the final project have been brainstormed. The program must include at least 4 topics each that have been covered in Processing and Arduino; they must have some communication between each other. After a thoughtful process of brainstorming and research for creative game ideas, I have come up with an idea of something similar to the snake game in Google; in the Google snake game, the snake has to keep eating the apple without hitting the edge of the screen as the snake gets longer when eating the apple. Inspired from this gmae, I came up with a new game with some significant changes from the snake game. Below is the picture of the snake game where I got inspiration from.

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/finalProject/images/snakeGameScreenshot.PNG?raw=true)

In the game that I came up with, the main character needs to go through the walls that keeps generating and moving closer to the character. The walls are randomly colored with select colors, and the character would have to change its color to the same color as the color of the incoming wall to go through the wall. I am planning to enable the character to change its color by pressing differently colored digital switches (buttons) connected to Arduino. Plus, there would be coins between every two walls and the coins would increase the score of the player. However, the coins would be at random y-coordinates, and in order to change the y-coordinate of the character, the player would have to control the potentiometer left and right. All these inputs from potentiometer and switches would be sent to Processing and received in the game. Plus, when the score increases as the player collects coins, the sound would play and LED would blink to inform the players. Below is the draft of the game design that I drew on paper.

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/finalProject/images/sketchOfGameDesign1.jpg?raw=true)


2021/06/30

Today, I have added the specific details about the final project. On the breadboard, there would be 3 buttons; unlike the initial thought, the speed of the walls would not increase as the difficulty of the game is already quite high as the player needs to control 2 different kinds of inputs on the breadboard. Since there are multiple input devices for the player, the buttons and the potentiometer would have to be easy to control - for example, they would need to have enough distance from the wires.

In Processing, I have created the start page where the title and my name displays. Since the game is about going through as many walls as possible and getting higher score, I have put an image of a wall and decided the name of the game as "Through the Walls". 
