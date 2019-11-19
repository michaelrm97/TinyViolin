/*
 * buttons.cpp
 *
 * Created: 26/10/2019 11:56:58 PM
 *  Author: Michael
 */ 

#include "buttons.h"

#include <Arduino.h>

// Initialize module
void Buttons::init(void) {
  for (int i = 0; i < NUM_BUTTONS; i++) {
    pinMode(button_pins[i], INPUT_PULLUP);
  }
}

// Return highest button that was pressed (1-4, 0 for no button pressed)
uint8_t Buttons::get_pressed() {
  for (int i = NUM_BUTTONS - 1; i >= 0; i--) {
    if (!digitalRead(button_pins[i])) {
      return i + 1;
    }
  }
  return 0;
}

// Determines all pressed buttons
uint8_t Buttons::get_all_pressed() {
  uint8_t num = 0;
  for (int i = 0; i < NUM_BUTTONS; i++) {
    num = (num << 1) | !digitalRead(button_pins[i]);
  }
  return num;
}
