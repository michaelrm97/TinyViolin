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

CRGB leds[NUM_LEDS] = {0};

void init_leds() {
  FastLED.addLeds<WS2812, LED_PIN>(leds, NUM_LEDS);
  FastLED.show();
}

// Specify specific colors (in rgb format) for each led
void display_leds(uint32_t g, uint32_t d, uint32_t a, uint32_t e) {
  leds[0] = g;
  leds[1] = d;
  leds[2] = a;
  leds[3] = e;
  FastLED.show();
}

// Specify string and position
void display_leds(uint8_t string, uint8_t position) {
  (void) string;
  (void) position;
}