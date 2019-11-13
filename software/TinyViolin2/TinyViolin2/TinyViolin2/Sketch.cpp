/*Begining of Auto generated code by Atmel studio */
#include <Arduino.h>

/*End of auto generated code by Atmel studio */

#include "buttons.h"
#include "notes.h"
#include "pot.h"
#include "song.h"

const auto MIC_PIN = 9;
const auto POT_PIN = A0;

//Buttons buttons;
Notes<MIC_PIN> notes;
Pot<POT_PIN> pot;
Song song;

#define CROTCHET_PERIOD 40  // How long to wait before displaying next note
                            // for a crotchet (half the expected time of
                            // playing the note at 75bpm)

void setup() {
  //buttons.init();
  //leds.init();
  notes.init();
  pot.init();
  //const auto pressed = buttons.get_all_pressed();
  if (song.init(0)) {
    //leds.display(LED_RED, LED_RED, LED_RED, LED_RED);
    notes.play(NOTE_A4);
    delay(100);
    notes.stop();
    while(1);
  }
}

void loop() {
  const auto start = millis();
  static pot_status_t pot_status = POT_NONE;
  const auto new_pot_status = pot.read();
  if (new_pot_status != pot_status/* || prev_button == new_button*/) {
  // Change in status
    if (new_pot_status == POT_NONE) {
      notes.stop(); // Stop if not moving bow
    } else { // Either changed bow or finger
    //if (new_button == next_finger) { // Check whether to advance
      song.advance_note();
    //leds.display(next_string, next_finger);
    //song.get_next_note(&next_string, &next_finger);
    //}
      notes.play(song.get_note(0)); // Play note
    }
  }
  pot_status = new_pot_status;
  song.update();
  while(millis() < start + 5);
}
