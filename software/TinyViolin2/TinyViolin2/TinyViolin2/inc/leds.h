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
    for (auto i = 0; i < NUM_LEDS; i++) {
      pinMode(led_pins[i], OUTPUT);
    }
  }

  void display(const bool g, const bool d, const bool a, const bool e) {
    status[0] = g;
    status[0] = d;
    status[0] = a;
    status[0] = e;
  }

  void display(const uint8_t finger) {
    for (auto i = 0; i < NUM_LEDS; i++) {
      status[i] = (i + 1) == finger;
    }
  }

  void update() {
    const auto on = count == 0;
    for (auto i = 0; i < NUM_LEDS; i++) {
      digitalWrite(led_pins[i], on & status[i]);
    }
    count++;
    if (count == 10) count = 0;
  }

 private:
  static const auto NUM_LEDS = 4;
  uint8_t led_pins[NUM_LEDS] = {7, 5, 1, 0};
  bool status[NUM_LEDS] = {false};
  int count = 0;
};

#endif /* LEDS_H_ */