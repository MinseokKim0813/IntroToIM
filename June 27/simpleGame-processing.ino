/*
  Minseok KIm
  2021/06/27
  Communicating with Processing to make a ball bouncing game
  Change in potentiometer value is transferred
*/

// Input pin no.
const int PIN = A0;

void setup() {
  // initialize the serial communication:
  Serial.begin(9600);

  // Since both sides wait for each other before they send anything,
  // someone needs to start the conversation
  Serial.println("0");
}

void loop() {
  while (Serial.available()) {
    Serial.parseInt(); // no need to store the value since we don't need it

    // Only proceed if we have the end of line
    if (Serial.read() == '\n') {

      // send the value of analog input
      Serial.println(analogRead(PIN));
    }
  }
}
