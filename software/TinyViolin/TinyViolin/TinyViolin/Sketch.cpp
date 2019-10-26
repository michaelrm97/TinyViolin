/*Begining of Auto generated code by Atmel studio */
#include <Arduino.h>

/*End of auto generated code by Atmel studio */

#include "inc/leds.h"
#include "inc/notes.h"
#include "inc/pot.h"

#include <FastLED.h>
#include <TimerOne.h>
//Beginning of Auto generated function prototypes by Atmel Studio
void play(void );
//End of Auto generated function prototypes by Atmel Studio


#define PERIOD 10000

void play(void) {
  read_pot();
}

void setup() {
  init_notes();
  init_leds();
  init_pot();
  Timer1.initialize(PERIOD);
  Timer1.attachInterrupt(play);
}

void loop() {

}
