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
  }

  void display(const bool g, const bool d, const bool a, const bool e) {
  }

  void display(const uint8_t string, const uint8_t finger) {
  }
 private:
  static const auto NUM_STRINGS = 5; // G, D, A, E, E+
  static const auto NUM_FINGERS = 5; // Open, 1st, 2nd, 3rd, 4th

};

#endif /* LEDS_H_ */