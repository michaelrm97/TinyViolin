/*
 * buttons.h
 *
 * Created: 26/10/2019 11:55:21 PM
 *  Author: Michael
 */ 


#ifndef BUTTONS_H_
#define BUTTONS_H_

#include <Arduino.h>

class Buttons {
 public:
  void init();
  uint8_t get_pressed();
  uint8_t get_all_pressed();

 private:
  static const auto NUM_BUTTONS = 4;
  uint8_t button_pins[NUM_BUTTONS] = {0, 1, 2, 3};
};

#endif /* BUTTONS_H_ */
