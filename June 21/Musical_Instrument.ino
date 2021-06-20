/* Minseok Kim
    2021/06/20
    Making a musical instrument with 1 potentiometer and 1 switch
*/

// Import pitches
#include "pitches.h"

// Pin number of the reading of the potentiometer
const int potentiometerPin = 0;
const int switchPin = 10;
const int speakerPin = 8;

int melody[] = {
  NOTE_C4, NOTE_CS4, NOTE_D4, NOTE_DS4, NOTE_E4, NOTE_F4, NOTE_FS4, NOTE_G4, NOTE_GS4, NOTE_A4, NOTE_AS4, NOTE_B4, NOTE_C5
};

int pitch = analogRead(potentiometerPin);

void setup() {
  Serial.begin(9600);
}

void loop() {
  int switchPressed = digitalRead(switchPin);
  // Setting the potentiometer input
  pitch = analogRead(potentiometerPin);
  pitch = map(pitch, 0, 1023, 0, 12);
  pitch = constrain(pitch, 0, 12);

  // If switch is pressed, play sound
  if (switchPressed == HIGH)
  {
    Serial.println(pitch);
    tone(speakerPin, melody[pitch], 500);
    //    delay(500);
  }
}
