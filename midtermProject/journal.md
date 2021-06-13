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

2021/06/11

Today, I completed the instruction page and worked on the background design of the main page. When the user clicks anywhere on the starting page, the program moves to the instruction page where I explained how to play the game. As the on-screen text indicates, when the user presses return or enter key, the program moves to the main page. 

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/midtermProject/Screenshots/instruction.PNG?raw=true)

In the main page, I have made the gradation function to make the background color keep changing between two specific colors. I did not have any big problen in creating the code for the gradation function or the instruction function today.

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/midtermProject/Screenshots/gradation.PNG?raw=true)
![](https://github.com/MinseokKim0813/IntroToIM/blob/main/midtermProject/Screenshots/gradation2.PNG?raw=true)

2021/06/12

Today, I have made a significant progress in the code of the program. In the main page, I created several functions that does the job to make the rhythm game. Aside from designing the main page that took quite a long time, the hardest task I faced was to create a function that automatically and randomly generates the sound pattern that the user has to imitate exactly. I faced a lot of problem while creating that code block. At first, I though of using an arraylist that consists of strings "UP","DOWN","LEFT","RIGHT". However, after many errors, I realized that the keycode input from the user, which the program needs to compare with the randomly generated pattern, was indeed integer ASCII value and not the string. Therefore, I used an integer array to store the 4 different integer value of the arrow keys, and made the program to randomly assign them in another array.

Then, I built a function to compare the given input array to the previously generated array - the answer. I then made another function that updates the function that randomly generates the pattern. I made it little more complicated by making it generate the pattern with random different number of sounds in the pattern. For example, once the current pattern is generated and then the user correctly inputs the same pattern, the program will then generate a sound pattern that has different number of sounds in it. In the process, I encountered a lot of errors mainly becuase I could not figure out an easy way to change the number of elements in an array in Java; but I eventually figured out that I can leave the unused elements as 0 and only iterate through the assigned elements in the array. 

Another problem I faced was while I was figuring out how to make the program know which index in the array in the pattern the user is inputting. Since the draw function is called every frame, I needed a way to keep a record of how many sounds in the pattern has already been input previously by the user in the current pattern. I thought of stack data type as a solution, so to make the current array that stores the sound pattern into a stack-like data type, I decided to simply push each element in the array to the next index whenever the user inputs a sound. This has solved the prolem perfectly.

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/midtermProject/Screenshots/pushing.PNG?raw=true)

I also designed the main page better, with a box in the middle to indicate whether the answer input is correct or not. The face smiles in the middle, but when the game is over, it would stop smiling. 

![](https://github.com/MinseokKim0813/IntroToIM/blob/main/midtermProject/Screenshots/mainpage1.PNG?raw=true)

