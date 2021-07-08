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

I have figured out a way to solve the problem I faced yesterday: how to send two different data from Arduino to Processing. It was much simpler than I thought. I created a boolean flag for the red and blue buttons each, and sent the value together with the data from the reading of the potentiometer. I have 
`// Sending the data for potentiometer input and colored button input to Processing
Serial.println(String(analogRead(potentiometer)) + "," + color);`
