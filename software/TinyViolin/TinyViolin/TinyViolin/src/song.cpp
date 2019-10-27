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

#define NOTE_BUFFER_SIZE 64
#define HALF_BUFFER_SIZE (NOTE_BUFFER_SIZE << 1)

static uint8_t open_notes[] = {
  NOTE_G3, NOTE_D4, NOTE_A4, NOTE_E5, NOTE_C6
};

static uint16_t song_notes[NOTE_BUFFER_SIZE];
static int curr_note = 0;
static int curr_buffer = 0;

static File song_file;

static void load_from_sd(File *f, uint16_t *buff, int n) {
  n *= 2;
  uint8_t *buf = (uint8_t *) buff;
  while (n > 0) {
    const auto c = f->read(buff, n);
    if (c == -1) {
      f->seek(0);
    } else {
      *buf++ = c;
      n--;
    }
  }
}

 // Initialize module to a given song
 int init_song(const uint8_t n) {
  (void) n;
  if (!SD.begin()) return -1;
  if (!SD.exists("song")) return -1;
  song_file = SD.open("song");
  load_from_sd(&song_file, song_notes, NOTE_BUFFER_SIZE);
  return 0;
 }

 // Gets note for a given fingering at this point in time
 uint8_t get_note(const uint8_t finger) {
  const auto string = GET_STRING(song_notes[curr_note]);
  if (finger == 0) return open_notes[string];
  else return open_notes[string] + 2 * finger -
      GET_OFFSET(song_notes[curr_note], finger);
 }

 // Get next note
 void get_next_note(uint8_t *string, uint8_t *finger) {
  int next = curr_note + 1;
  if (next == NOTE_BUFFER_SIZE) next = 0;
  *string = GET_STRING(song_notes[next]);
  *finger = GET_FINGER(song_notes[next]);
 }

 // Advance to next note in song - return time to display
 uint8_t advance_note(void) {
  curr_note++;
  if (curr_note == NOTE_BUFFER_SIZE) curr_note = 0;
  return GET_LENGTH(song_notes[curr_note]);
 }

// Update notes from SD card
void update_song(void) {
  if (curr_buffer == 0 && curr_note >= HALF_BUFFER_SIZE) {
    curr_buffer = 1;
    load_from_sd(&song_file, song_notes, HALF_BUFFER_SIZE);
  } else {
    curr_buffer = 0;
    load_from_sd(&song_file, song_notes + HALF_BUFFER_SIZE, HALF_BUFFER_SIZE);
  }
}
