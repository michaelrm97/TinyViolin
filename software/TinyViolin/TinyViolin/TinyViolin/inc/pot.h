/*
 * pot.h
 *
 * Created: 26/10/2019 11:55:09 PM
 *  Author: Michael
 */ 


#ifndef POT_H_
#define POT_H_

#include <Arduino.h>

typedef enum {
  POT_NONE,
  POT_DOWN,
  POT_UP  
} pot_status_t;

template <int pin>
class Pot {
 public:
  void init() {}
  pot_status_t read() {
    const int val = analogRead(pin);
    int diff = 0;
    if (prev != -1) {
      diff = val - prev;
    }
    prev = val;
    diff_avg -= diffs[i];
    diffs[i] = diff;
    diff_avg += diff;
    i = (i + 1) % NUM_DIFFS;
    const float rate = (float)diff_avg / NUM_DIFFS;
    if (rate > THRESH) {
      return POT_UP;
      } else if (rate < -THRESH) {
      return POT_DOWN;
      } else {
      return POT_NONE;
    }
  }
 private:
  static const auto NUM_DIFFS = 8;
  static const auto THRESH = 2;

  int i = 0;
  int prev = -1;
  int diffs[NUM_DIFFS] = {0};
  int diff_avg = 0;

};


#endif /* POT_H_ */