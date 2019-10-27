/*
 * song.h
 *
 * Created: 26/10/2019 11:55:35 PM
 *  Author: Michael
 */ 


#ifndef SONG_H_
#define SONG_H_

#include <Arduino.h>

// Initialize module to a given song
int init_song(const uint8_t n);

// Gets note for a given fingering at this point in time
uint8_t get_note(const uint8_t finger);

// Get next note
void get_next_note(uint8_t *string, uint8_t *finger);

// Advance to next note in song - return time to display
uint8_t advance_note(void);

// Update notes from SD card
void update_song(void);

#endif /* SONG_H_ */
