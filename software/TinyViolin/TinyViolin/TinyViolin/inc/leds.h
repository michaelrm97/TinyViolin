/*
 * leds.h
 *
 * Created: 26/10/2019 11:54:54 PM
 *  Author: Michael
 */ 

#ifndef LEDS_H_
#define LEDS_H_

#include <Arduino.h>

// Initialize module
void init_leds();

// Specify specific colors (in RGB format) for each led
void display_leds(const uint32_t g, const uint32_t d, const uint32_t a, const uint32_t e);

// Specify string and finger
void display_leds(const uint8_t string, const uint8_t finger);

#endif /* LEDS_H_ */