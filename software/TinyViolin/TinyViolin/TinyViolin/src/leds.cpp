/*
 * leds.cpp
 *
 * Created: 26/10/2019 11:56:43 PM
 *  Author: Michael
 */ 

#include "leds.h"

#include <Arduino.h>
#include <FastLED.h>

#define NUM_LEDS 4
#define LED_PIN 4

#define NUM_STRINGS 5 // G, D, A, E, E+
#define NUM_FINGERS 5 // Open, 1st, 2nd, 3rd, 4th

static uint32_t led_colors[NUM_STRINGS][NUM_FINGERS] = {
  {0x000001, 0x000002, 0x000003, 0x000004, 0x000005},
  {0x000001, 0x000002, 0x000003, 0x000004, 0x000005},
  {0x000001, 0x000002, 0x000003, 0x000004, 0x000005},
  {0x000001, 0x000002, 0x000003, 0x000004, 0x000005},
  {0x000001, 0x000002, 0x000003, 0x000004, 0x000005}
};

static CRGB leds[NUM_LEDS] = {0};

void init_leds() {
  FastLED.addLeds<WS2812, LED_PIN>(leds, NUM_LEDS);
  FastLED.show();
}

// Specify specific colors (in RGB format) for each led
void display_leds(uint32_t g, uint32_t d, uint32_t a, uint32_t e) {
  leds[0] = g;
  leds[1] = d;
  leds[2] = a;
  leds[3] = e;
  FastLED.show();
}

// Specify string and finger
void display_leds(uint8_t string, uint8_t finger) {
  for (int i = 0; i < NUM_LEDS; i++) {
    if (finger == 0 || i + 1 == finger) {
      leds[i] = led_colors[string][finger];
    } else {
      leds[i] = 0;
    }
  }
  FastLED.show();
}
