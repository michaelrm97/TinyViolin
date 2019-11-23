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
 * * note offset : 3 bits each
 * * length : 12 bits (length in 5ms intervals)
 */

#define GET_STRING(n)     ((n >> 28)                & 0x00F)
#define GET_FINGER(n)     ((n >> 24)                & 0x00F)
#define GET_OFFSET(n, f)  ((n >> (24 - (f * 3)))    & 0x007)
#define GET_LENGTH(n)     ((n >> 0)                 & 0xFFF)

// Do a bubble sort so songs are in alphabetical order
static void sort(String names[], int n) {
  while (1) {
    bool unsorted = false;
    for (int j = 0; j < n - 1; j++) {
      if (names[j] > names[j + 1]) {
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
      if (curr_song == num_files) curr_song = 0;
      song_file = SD.open("songs/" + songs[curr_song]);
    } else {
      *buf++ = c;
      n--;
    }
  }
}

// Initialize module to a given song
bool Song::init(uint8_t n) {
  // CHeck if SD card is there
  if (!SD.begin(10)) {
    return -1;
  }
  // Open songs folder
  File dir = SD.open("songs");
  if (dir == NULL) {
    return -1;
  }
  // Open up to 16 files and read their names into String array
  while (num_files < MAX_FILES) {
    File entry = dir.openNextFile();
    if (entry == NULL) break;
    char name[MAX_FILE_NAME + 1];
    entry.getName(name, MAX_FILE_NAME + 1);
    songs[num_files++] = name;
    entry.close();
  }
  dir.close();
  
  if (num_files == 0) return -1;
  
  // Sort songs alphabetically
  sort(songs, num_files);

  // Load nth song (last song if n > num_files)
  if (n >= num_files) n = num_files - 1;
  
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
