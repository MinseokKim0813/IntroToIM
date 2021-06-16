/*
   Minseok Kim
   2021/06/17
   Taking 1 analog and 1 digital inputs, output 2 different LED outputs
*/

const int switch_red = 2;
const int LED_red = 4;
const int sensor_light = A0;
const int LED_blue = 6;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(switch_red, INPUT);
  pinMode(LED_red, OUTPUT);

}

void loop() {
  // Controling red LED from digital input (switch)
  int switch_pressed = digitalRead(switch_red);
  // when switch is pressed
  if (switch_pressed == HIGH)
  {
    // Keep blinking with 0.5 seconds delay
    digitalWrite(LED_red, HIGH);
    delay(500);
    digitalWrite(LED_red, LOW);
    delay(500);
  }
  else
  {
    // Keep blinking with 0.1 seconds delay
    digitalWrite(LED_red, HIGH);
    delay(100);
    digitalWrite(LED_red, LOW);
    delay(100);
  }

  // Controling blue LED from analogue input (light sensor)
  int sensorValue = analogRead (sensor_light); // between 0~1023
  // contraining and remapping the range
  int brightness_LED = map(sensorValue, 100, 950, 0, 255);
  brightness_LED = constrain(brightness_LED, 0, 255);
  // reversing the value so it is brighter when the room is darker
  brightness_LED = 255 - brightness_LED;
  analogWrite(LED_blue, brightness_LED); // between 0~255
}
