/*
 * pot.cpp
 *
 * Created: 26/10/2019 11:56:25 PM
 *  Author: Michael
 */ 

#include "pot.h"

#include <Arduino.h>

#define POT_PIN A0
#define NUM_DIFFS 8
#define THRESH 2

// Initialize module
void init_pot() {
  // Don't actually do anything here
}

// Read pot value and return if pot is sliding up or down
pot_status_t read_pot() {
  static int i = 0;
  static int prev = -1;
  static int diffs[NUM_DIFFS] = {0};
  static int diff_avg = 0;
  const int val = analogRead(POT_PIN);
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
