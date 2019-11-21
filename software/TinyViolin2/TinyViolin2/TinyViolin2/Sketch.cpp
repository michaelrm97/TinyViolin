﻿/*Begining of Auto generated code by Atmel studio */
#include <Arduino.h>

/*End of auto generated code by Atmel studio */

#include "buttons.h"
#include "leds.h"
#include "notes.h"
#include "pot.h"
#include "song.h"

const auto MIC_PIN = 9;
const auto POT_PIN = A0;

Buttons buttons;
Leds leds;
Notes<MIC_PIN> notes;
Pot<POT_PIN> pot;
Song song;

void setup() {
  // Initialize all modules
  buttons.init();
  leds.init();
  notes.init();
  pot.init();

  const auto pressed = buttons.get_all_pressed();

  if (song.init(pressed)) {
    // Turn on all LEDs and play a beep on error
    leds.display(true, true, true, true);
    notes.play(NOTE_A4);
    delay(100);
    notes.stop();
    while(1);
  }
}

void loop() {
  static pot_status_t pot_status = POT_NONE;
  static int8_t prev_button = -1;
  static int8_t next_finger = -1;
  static uint16_t dur = 0;

  // Get first next finger
  if (next_finger == -1) {
    next_finger = song.get_next_finger();
    leds.display(next_finger);
  }

  // Read pot and button status
  const auto start = millis();
  const auto new_pot_status = pot.read();
  const auto new_button = buttons.get_pressed();
  
  if (new_pot_status != pot_status || prev_button != new_button) {
    // Change in status
    if (new_pot_status == POT_NONE) {
      notes.stop(); // Stop if not moving bow
      leds.display(next_finger);
    } else { // Either changed bow or finger
      if (new_button == next_finger) { // Check whether to advance
        dur = song.advance_note();
        leds.display(next_finger);
        next_finger = song.get_next_finger();
      }
      notes.play(song.get_note(new_button)); // Play note
    }
  }
  
  // Display next note to play once its time
  // If dur is initially 0 the next note won't display until there's a rest
  if (dur > 0) {
    dur--;
    if (dur == 0) {
      leds.display(next_finger);
    }
  }
  
  // Update statuses
  pot_status = new_pot_status;
  prev_button = new_button;
  song.update();
  
  while(millis() < start + 5); // Sample every 5ms
}
