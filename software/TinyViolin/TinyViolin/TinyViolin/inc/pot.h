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

// Initialize module
void init_pot();

// Read pot value and return if pot is sliding up or down
pot_status_t read_pot();

#endif /* POT_H_ */