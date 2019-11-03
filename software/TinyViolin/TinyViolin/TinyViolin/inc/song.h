/*
 * song.h
 *
 * Created: 26/10/2019 11:55:35 PM
 *  Author: Michael
 */ 


#ifndef SONG_H_
#define SONG_H_

#include <Arduino.h>
#include <SD.h>

#include "notes.h"

class Song {
 public:
  // Initialize song with given song number
  bool init(uint8_t n);

  // Gets note for a given fingering at this point in time
  uint8_t get_note(const uint8_t finger);

  // Get next note
  void get_next_note(uint8_t *string, uint8_t *finger);

  // Advance to next note in song - return time to display
  uint8_t advance_note();

  void update();
 
 private:
  static const auto NOTE_BUFFER_SIZE = 64;
  static const auto NUM_STRINGS = 5;
  static constexpr auto HALF_BUFFER_SIZE = (NOTE_BUFFER_SIZE << 1);

  uint8_t open_notes[NUM_STRINGS] = {
    NOTE_G3, NOTE_D4, NOTE_A4, NOTE_E5, NOTE_C6
  };

  uint16_t song_notes[NOTE_BUFFER_SIZE];
  int curr_note = 0;
  int curr_buffer = 0;

  File song_file;

  void load_from_sd(uint16_t *buff, int n);

};

#endif /* SONG_H_ */
