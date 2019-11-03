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

const auto LED_PIN = 4;
const auto NUM_LEDS = 4;
const auto MIC_PIN = 9;
const auto POT_PIN = A0;

Buttons buttons;
Leds<LED_PIN, NUM_LEDS> leds;
Notes<MIC_PIN> notes;
Pot<POT_PIN> pot;
Song song;

void play(void);

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
  const auto new_pot_status = pot.read();
  const auto new_button = buttons.get_pressed();
  if (start) { // Initial state
    start = false;
    song.get_next_note(&next_string, &next_finger);
    leds.display(next_string, next_finger);
  }
  if (new_pot_status != pot_status || prev_button == new_button) {
    // Change in status
    if (new_pot_status == POT_NONE) {
      notes.stop(); // Stop if not moving bow
    } else { // Either changed bow or finger
      if (new_button == next_finger) { // Check whether to advance
        note_wait = song.advance_note() * CROTCHET_PERIOD / 4;
        leds.display(next_string, next_finger);
        song.get_next_note(&next_string, &next_finger);
      }
      notes.play(song.get_note(new_button)); // Play note
    }
  }
  if (note_wait > 0) { // Change leds to show next note
    note_wait--;
    if (note_wait == 0) {
      leds.display(next_string, next_finger);
    }
  }
}

void setup() {
  buttons.init();
  leds.init();
  notes.init();
  pot.init();
  const auto pressed = buttons.get_all_pressed();
  if (song.init(pressed)) {
    leds.display(LED_RED, LED_RED, LED_RED, LED_RED);
    while(1);
  }
  Timer1.initialize(PERIOD);
  Timer1.attachInterrupt(play);
}

void loop() {
  song.update();
}
