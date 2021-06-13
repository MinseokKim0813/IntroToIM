/*
   Minseok Kim
   2021/06/13
   Using 3 switches and 3 LEDs; each switch does different function
*/

const int sw_blue = A2;
const int sw_yellow = 4;
const int sw_red = A0;
const int LED_blue = 11;
const int LED_yellow = 8;
const int LED_red = 2;

// Run once
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  // Making sw_blue, sw_yellow, sw_red input and LED_blue, LED_yellow, LED_red output
  pinMode(sw_blue, INPUT);
  pinMode(sw_yellow, INPUT);
  pinMode(sw_red, INPUT);
  pinMode(LED_blue, OUTPUT);
  pinMode(LED_yellow, OUTPUT);
  pinMode(LED_red, OUTPUT);

}

// Run forever
void loop() {
  // read the input pin
  int sw_blue_pressed = digitalRead(sw_blue);
  int sw_yellow_pressed = digitalRead(sw_yellow);
  int sw_red_pressed = digitalRead(sw_red);

  // Checking if any switch is pressed
  if (sw_blue_pressed == HIGH)
  {
    Serial.println("blue switch is pressed.");
    digitalWrite(LED_blue, HIGH);   // turn the LED on (HIGH is the voltage level)
    digitalWrite(LED_red, LOW);
    delay(1000);                       // wait for a second
    digitalWrite(LED_blue, LOW);    // turn the LED off by making the voltage LOW
    digitalWrite(LED_red, HIGH);
    delay(1000);                       // wait for a second
    // turn off everything if button is not pressed anymore
    digitalWrite(LED_red, LOW);
  }

  if (sw_yellow_pressed == HIGH)
  {
    Serial.println("yellow switch is pressed");
    // turn on yellow and off blue lights
    digitalWrite(LED_yellow, HIGH);
    digitalWrite(LED_blue, LOW);
    delay(500);
    // turn off yellow and on blue light
    digitalWrite(LED_yellow, LOW);
    digitalWrite(LED_blue, HIGH);
    delay(500);
    // turn off everything if button is not pressed anymore
    digitalWrite(LED_blue, LOW);
  }

  if (sw_red_pressed == HIGH)
  {
    Serial.println("red switch is pressed");
    // turn on only red
    digitalWrite(LED_red, HIGH);
    digitalWrite(LED_blue, LOW);
    digitalWrite(LED_yellow, LOW);
    delay(300);
    // turn on only yellow
    digitalWrite(LED_red, LOW);
    digitalWrite(LED_yellow, HIGH);
    digitalWrite(LED_blue, LOW);
    delay(300);
    // turn on only blue
    digitalWrite(LED_red, LOW);
    digitalWrite(LED_yellow, LOW);
    digitalWrite(LED_blue, HIGH);
    delay(300);
    // turn off everything if button is not pressed anymore
    digitalWrite(LED_blue, LOW);

  }
}
