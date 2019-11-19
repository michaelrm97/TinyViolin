/*
 * song.cpp
 *
 * Created: 26/10/2019 11:56:34 PM
 *  Author: Michael
 */ 

#include "song.h"

#include <Arduino.h>
#include <SdFat.h>

#include "notes.h"

SdFat SD;

/*
 * Format of each note in song (4 bytes):
 * * string : 4 bits
 * * correct finger : 4 bits
 * * note offset : 4 bits each
 * * length : 8 bits (crotchet = 4, quaver = 2, semi-quaver = 1, inf = 0)
 */

#define GET_STRING(n)     ((n >> 28)                & 0x0F)
#define GET_FINGER(n)     ((n >> 24)                & 0x0F)
#define GET_OFFSET(n, f)  ((n >> (24 - (f << 2)))   & 0x0F)
#define GET_LENGTH(n)     ((n >> 0)                 & 0xFF)

// Do a bubble sort
static void sort(String *names, int n) {
  for (int i = 0; i < n; i++) {
    bool unsorted = false;
    for (int j = 0; j < n - 1; j++) {
      String a = names[j];
      String b = names[j + 1];
      a.toLowerCase();
      b.toLowerCase();
      if (a > b) {
        String tmp = names[j + 1];
        names[j + 1] = names[j];
        names[j] = tmp;
        unsorted = true;
      }
    }
    if (!unsorted) return;
  }
}

void Song::load_from_sd(uint32_t *buff, uint16_t n) {
  n *= 4;
  uint8_t *buf = (uint8_t *) buff;
  while (n > 0) {
    const auto c = song_file.read();
    if (c == -1) {
      song_file.close();
      curr_song++;
      song_file = SD.open("songs/" + songs[curr_song]);
    } else {
      *buf++ = c;
      n--;
    }
  }
}

// Initialize module to a given song
bool Song::init(uint8_t n) {
  if (!SD.begin(10)) {
    return -1;
  }
  File dir = SD.open("songs");
  if (dir == NULL) {
    return -1;
  }
  int i = 0;
  while (i < MAX_FILES) {
    File entry = dir.openNextFile();
    if (entry == NULL) break;
    char name[MAX_FILE_NAME + 1];
    entry.getName(name, MAX_FILE_NAME + 1);
    songs[num_files++] = name;
    entry.close();
  }
  dir.close();
  sort(songs, num_files);

  if (num_files == 0) return -1;

  if (n > num_files) n = num_files - 1;
  
  song_file = SD.open("songs/" + songs[n]);
  if (song_file == NULL) return -1;
  curr_song = n;

  load_from_sd(song_notes, NOTE_BUFFER_SIZE);
  return 0;
}

// Gets note for a given fingering at this point in time
uint8_t Song::get_note(const uint8_t finger) {
  const auto curr = curr_note == -1 ? 0 : curr_note;
  const auto string = GET_STRING(song_notes[curr]);
  if (finger == 0) return open_notes[string];
  else return open_notes[string] + 
      GET_OFFSET(song_notes[curr], finger);
}

// Get next note
uint8_t Song::get_next_finger() {
  int next = curr_note + 1;
  if (next == NOTE_BUFFER_SIZE) next = 0;
  return GET_FINGER(song_notes[next]);
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
  } else if (curr_buffer == 1 && curr_note < HALF_BUFFER_SIZE) {
    curr_buffer = 0;
    load_from_sd(song_notes + HALF_BUFFER_SIZE, HALF_BUFFER_SIZE);
  }
}
