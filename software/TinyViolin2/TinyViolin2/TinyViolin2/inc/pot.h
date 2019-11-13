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
  void init() {
    for (int i = 0; i < NUM_DIFFS; i++) {
      diffs[i] = 0;
    }
  }
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
    if (rate > THRESH || (prev_status == POT_UP && rate > LOWER_THRESH)) {
      prev_status = POT_UP;
      return POT_UP;
    } else if (rate < -THRESH || (prev_status == POT_DOWN && rate < -LOWER_THRESH)) {
      prev_status = POT_DOWN;
      return POT_DOWN;
    } else {
      prev_status = POT_NONE;
      return POT_NONE;
    }
  }
 private:
  static const auto NUM_DIFFS = 32;
  static constexpr auto THRESH = 2.5;
  static constexpr auto LOWER_THRESH = 0.25;

  int i = 0;
  int prev = -1;
  int diffs[NUM_DIFFS];
  int diff_avg = 0;
  pot_status_t prev_status = POT_NONE;

};


#endif /* POT_H_ */