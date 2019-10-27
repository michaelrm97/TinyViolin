/*Begining of Auto generated code by Atmel studio */
#include <Arduino.h>

/*End of auto generated code by Atmel studio */

#include "buttons.h"
#include "leds.h"
#include "notes.h"
#include "pot.h"
#include "song.h"

#include <FastLED.h>
#include <TimerOne.h>
//Beginning of Auto generated function prototypes by Atmel Studio
void play(void);
//End of Auto generated function prototypes by Atmel Studio

#define PERIOD 10000

#define CROTCHET_PERIOD 40  // How long to wait before displaying next note
                            // for a crotchet (half the expected time of
                            // playing the note at 75bpm)

void play(void) {
  static bool start = true;
  static pot_status_t pot_status = POT_NONE;
  static uint8_t prev_button = 0;
  static uint16_t note_wait = 0;
  static uint8_t next_string, next_finger;
  const auto new_pot_status = read_pot();
  const auto new_button = get_pressed_button();
  if (start) { // Initial state
    start = false;
    get_next_note(&next_string, &next_finger);
    display_leds(next_string, next_finger);
  }
  if (new_pot_status != pot_status || prev_button == new_button) {
    // Change in status
    if (new_pot_status == POT_NONE) {
      stop_note(); // Stop if not moving bow
    } else { // Either changed bow or finger
      if (new_button == next_finger) { // Check whether to advance
        note_wait = advance_note() * CROTCHET_PERIOD / 4;
        display_leds(next_string, next_finger);
        get_next_note(&next_string, &next_finger);
      }
      play_note(get_note(new_button)); // Play note
    }
  }
  if (note_wait > 0) { // Change leds to show next note
    note_wait--;
    if (note_wait == 0) {
      display_leds(next_string, next_finger);
    }
  }
}

void setup() {
  init_buttons();
  init_leds();
  init_notes();
  init_pot();
  const auto pressed = get_pressed_buttons();
  if (init_song(pressed)) {
    display_leds(LED_RED, LED_RED, LED_RED, LED_RED);
    while(1);
  }
  Timer1.initialize(PERIOD);
  Timer1.attachInterrupt(play);
}

void loop() {
  update_song();
}
