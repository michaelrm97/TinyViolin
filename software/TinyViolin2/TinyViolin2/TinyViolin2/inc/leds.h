/*
 * leds.h
 *
 * Created: 26/10/2019 11:54:54 PM
 *  Author: Michael
 */ 

#ifndef LEDS_H_
#define LEDS_H_

#include <Arduino.h>

class Leds {
 public:
  void init() {
    for (int i = 0; i < NUM_LEDS; i++) {
      pinMode(led_pins[i], OUTPUT);
    }
  }

  void display(const bool g, const bool d, const bool a, const bool e) {
    digitalWrite(led_pins[0], g);
    digitalWrite(led_pins[1], d);
    digitalWrite(led_pins[2], a);
    digitalWrite(led_pins[3], e);
  }

  void display(const uint8_t finger) {
    for (int i = 0; i < NUM_LEDS; i++) {
      digitalWrite(led_pins[i], (i + 1) == finger);
    }
  }
 private:
  static const auto NUM_LEDS = 4;
  uint8_t led_pins[NUM_LEDS] = {7, 5, 1, 0};
};

#endif /* LEDS_H_ */