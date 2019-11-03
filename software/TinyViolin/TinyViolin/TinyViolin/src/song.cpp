/*
 * song.cpp
 *
 * Created: 26/10/2019 11:56:34 PM
 *  Author: Michael
 */ 

#include "song.h"

#include <Arduino.h>
#include <SD.h>

#include "notes.h"

/*
 * Format of each note in song:
 * * string : 3 bits
 * * correct finger : 3 bits
 * * note offset : 4 bits
 * * length : 6 bits (crotchet = 4, quaver = 2, semi-quaver = 1, inf = 0)
 */

#define GET_STRING(n)     ((n >> 13)        & 0x07)
#define GET_FINGER(n)     ((n >> 10)        & 0x07)
#define GET_OFFSET(n, f)  ((n >> (10 - f))  & 0x01)
#define GET_LENGTH(n)     ((n >> 0)         & 0x3F)

void Song::load_from_sd(uint16_t *buff, int n) {
  n *= 2;
  uint8_t *buf = (uint8_t *) buff;
  while (n > 0) {
    const auto c = song_file.read(buff, n);
    if (c == -1) {
      song_file.seek(0);
    } else {
      *buf++ = c;
      n--;
    }
  }
}

 // Initialize module to a given song
bool Song::init(const uint8_t n) {
  (void) n;
  if (!SD.begin()) return -1;
  if (!SD.exists("song")) return -1;
  song_file = SD.open("song");
  load_from_sd(song_notes, NOTE_BUFFER_SIZE);
  return 0;
}

// Gets note for a given fingering at this point in time
uint8_t Song::get_note(const uint8_t finger) {
  const auto string = GET_STRING(song_notes[curr_note]);
  if (finger == 0) return open_notes[string];
  else return open_notes[string] + 2 * finger -
    GET_OFFSET(song_notes[curr_note], finger);
}

// Get next note
void Song::get_next_note(uint8_t *string, uint8_t *finger) {
int next = curr_note + 1;
if (next == NOTE_BUFFER_SIZE) next = 0;
*string = GET_STRING(song_notes[next]);
*finger = GET_FINGER(song_notes[next]);
}

// Advance to next note in song - return time to display
uint8_t Song::advance_note(void) {
  curr_note++;
  if (curr_note == NOTE_BUFFER_SIZE) curr_note = 0;
  return GET_LENGTH(song_notes[curr_note]);
}

// Update notes from SD card
void Song::update(void) {
  if (curr_buffer == 0 && curr_note >= HALF_BUFFER_SIZE) {
    curr_buffer = 1;
    load_from_sd(song_notes, HALF_BUFFER_SIZE);
  } else {
    curr_buffer = 0;
    load_from_sd(song_notes + HALF_BUFFER_SIZE, HALF_BUFFER_SIZE);
  }
}
