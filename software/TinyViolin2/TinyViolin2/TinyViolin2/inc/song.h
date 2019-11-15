/*
 * song.h
 *
 * Created: 26/10/2019 11:55:35 PM
 *  Author: Michael
 */ 


#ifndef SONG_H_
#define SONG_H_

//#define TEST_SONG

#include <Arduino.h>
#include <SDFat.h>

#include "notes.h"

class Song {
 public:
  // Initialize song with given song number
  bool init(uint8_t n);

  // Gets note for a given fingering at this point in time
  uint8_t get_note(const uint8_t finger);

  // Get next finger
  uint8_t get_next_finger();

  // Advance to next note in song - return time to display
  uint8_t advance_note();

  void update();
 
 private:
#ifndef TEST_SONG
  static const auto NOTE_BUFFER_SIZE = 16;
  static constexpr auto HALF_BUFFER_SIZE = (NOTE_BUFFER_SIZE >> 1);
#else
  static const auto NOTE_BUFFER_SIZE = 8;
#endif
  static const auto NUM_STRINGS = 5;

  uint8_t open_notes[NUM_STRINGS] = {
    NOTE_G3, NOTE_D4, NOTE_A4, NOTE_E5, NOTE_B6
  };

  uint32_t song_notes[NOTE_BUFFER_SIZE];
  int16_t curr_note = -1;
#ifndef TEST_SONG
  int curr_buffer = 0;
  File dir;
  File song_file;

  void load_from_sd(uint32_t *buff, uint16_t n);
#endif

};

#endif /* SONG_H_ */
