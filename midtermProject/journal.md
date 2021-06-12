2021/06/08

The preparation for the midterm project has started. I initially planned to build a game where the user has to control the character to dodge the bullets. However, as I was introduced to the sound function of Processing, I decided to try making a rhythm game. Although the concept of the game is vague at this point, I am thinking of building a game where the play has to repeat exactly the randomly generated music pattern of a set of instrument or notes in a correct sequence right after they hear it. 

The pattern would be randomly generated, and each instrument would be assigned to a specific key in the keyboard. The program would check if the player pressed them in the right order at the right time through if statements and arrays. 


2021/06/09

I have created the basic 4 shapes that would each play different sound. I would have to adjust their positions and sizes later on as I add more features to the game. I added a constant variable of the number of instruments; I also added a void drawDrum() which draws the shapes that represent the instrument buttons.

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/midtermProject/Screenshots/screenshot.PNG?raw=true)

2021/06/10

I created the starting page of the game today. I took an image from a website in the internet - I would upload the citation later in a folder in Github. In the starting page, the name of the game "Rhythm Game" and the developer's name "Minseok Kim" appears on top and an image of a musical note appears. Then, "Click anywhere to proceed" appears and keeps blinking to catch the attention of the player. I used the code snippet attached below to make it blink - I struggled hard. I first used frameRate function to display it for half of the frames that are displayed per second, but realized that the time interval is irregular because the framerate is not constant. Therefore, I deicded to use the predefined functino millis(). I set it to display every alternate second.

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/midtermProject/Screenshots/startPage.PNG?raw=true)
![](https://github.com/MinseokKim0813/IntroToIM/blob/main/midtermProject/Screenshots/startPageCode.PNG?raw=true)


In the instruction page, I explained how to play the game, and made it to detect the enter or return key to start the game.
