/*
 * leds.h
 *
 * Created: 26/10/2019 11:54:54 PM
 *  Author: Michael
 */ 

#ifndef LEDS_H_
#define LEDS_H_

#include <Arduino.h>
#include <FastLED.h>

const auto LED_RED = CRGB::Red;

template <int pin, int num>
class Leds {
 public:
  void init() {
    FastLED.addLeds<WS2812, pin>(leds, num);
    FastLED.show();
  }

  void display(const uint32_t g, const uint32_t d, const uint32_t a, const uint32_t e) {
    leds[0] = g;
    leds[1] = d;
    leds[2] = a;
    leds[3] = e;
    FastLED.show();
  }

  void display(const uint8_t string, const uint8_t finger) {
    for (int i = 0; i < num; i++) {
      if (finger == 0 || i + 1 == finger) {
        leds[i] = colors[string][finger];
      } else {
        leds[i] = 0;
      }
    }
    FastLED.show();
  }
 private:
  CRGB leds[num];

  static const auto NUM_STRINGS = 5; // G, D, A, E, E+
  static const auto NUM_FINGERS = 5; // Open, 1st, 2nd, 3rd, 4th

  uint32_t colors[NUM_STRINGS][NUM_FINGERS] = {
    {0xff0000, 0xff4000	,0xff8000, 0xffbf00 ,0xbfff00},
    {0xbfff00, 0x80ff00, 0x40ff00, 0x00ff00, 0x00ff40},
    {0x00ff80, 0x00ffbf, 0x00ffff, 0x00bfff, 0x0080ff},
    {0x0040ff, 0x0000ff, 0x4000ff, 0x8000ff, 0xbf00ff},
    {0xff00ff, 0xff00bf, 0xff0080, 0xff0040, 0xff0000}
  };
};

#endif /* LEDS_H_ */