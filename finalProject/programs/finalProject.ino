/*
 * Minseok KIm
 * 2021/07/05
 * Final project (connected with Processing)
 * 
 * A game; the player needs to control the buttons and potentiometer to move and change the color of the main character.
 * 
 * This program sends the data from digital switches, potentiometer to Processing;
 * it also receives inputs from processing to control speaker accordingly.
 * 
 * When a coin is eaten, speaker plays a sound; when the button is pressed, RGB light lights up with the same color.
 * 
 * This Arduino program uses analog input (potentiometer), digital output (RGB light), tone (speaker), and digital input (switches).
 */

// Import pitches
#include "pitches.h"

// Temporary time constant
unsigned long temp = 0;

// potentiometer pin no.
const int potentiometer = A0;

// blue button pin no.
const int blueButton = 13;
// red button pin no.
const int redButton = 12;

// LED pin no.
const int blueLED = 10;
const int greenLED = 9;
const int redLED = 8;

// Speaker pin no.
const int speaker = 7;

// Game constants
String color = "white";
int coinEaten = 0;
int pitch = NOTE_C7;


void setup() {
  Serial.begin(9600);

  pinMode(blueButton, INPUT);
  pinMode(redButton, INPUT);
  pinMode(blueLED, OUTPUT);
  pinMode(greenLED, OUTPUT);
  pinMode(redLED, OUTPUT);
  pinMode(speaker, OUTPUT);

  // Initializing the conversation here since both Arduino and Processing wait for each other before they send anything
  Serial.println("0,black");
}


void loop() {

  int redButtonPressed = digitalRead(redButton);
  int blueButtonPressed = digitalRead(blueButton);

  // If red button is pressed, the color is "red"
  if (redButtonPressed == HIGH)
  {
    color = "red";
    // Indicate the color with LED
    temp = millis();
    digitalWrite(redLED,HIGH);
  }
  // If blue button is pressed, the color is "blue"
  if (blueButtonPressed == HIGH)
  {
    color = "blue";
    // Indicate the color with LED
    temp = millis();
    digitalWrite(blueLED,HIGH);
  }

  // Serial control
  while (Serial.available()) {
    // Processing sends data of coinEaten as "1" (boolean but transferred as integer)
    coinEaten = Serial.parseInt();

    // Wait until the end of line
    if (Serial.read() == '\n') {

      // Sending the data for potentiometer input and colored button input to Processing
      Serial.println(String(analogRead(potentiometer)) + "," + color);
    }
  }

  // If a coin has been eaten, play a sound through the speaker
  if (coinEaten == 1)
  {
    coinEaten = 0;
    tone(speaker, pitch, 200);
  }

  // Turn off LED light after 1 second
  if (millis() - temp >= 1000)
  {
    digitalWrite(blueLED,LOW);
    digitalWrite(redLED,LOW);
  }
}
