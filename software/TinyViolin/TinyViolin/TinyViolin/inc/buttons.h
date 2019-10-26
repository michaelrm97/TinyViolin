/*
 * buttons.h
 *
 * Created: 26/10/2019 11:55:21 PM
 *  Author: Michael
 */ 


#ifndef BUTTONS_H_
#define BUTTONS_H_

#include <Arduino.h>

// Initialize module
void init_buttons(void);

// Return highest button that was pressed (1-4, 0 for no button pressed)
uint8_t get_pressed_button(void);

// Determines all pressed buttons
uint8_t get_pressed_buttons(void);

#endif /* BUTTONS_H_ */
