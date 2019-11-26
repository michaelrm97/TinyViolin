using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;

namespace TVLoaderConsole
{
   class Song
   {

      internal struct Note
      {
         internal byte note;
         internal byte finger;
         internal byte[] offsets;
         internal ushort length;

         internal byte Str { get; set; }

         internal Note(byte _note, byte _str, byte _finger, byte[] _offsets, ushort _length)
         {
            note = _note;
            Str = _str;
            finger = _finger;
            offsets = _offsets;
            length = _length;
         }

         internal uint Format()
         {
            uint bits = 0;
            bits |= (uint)(Str << 28);
            bits |= (uint)(finger << 24);
            for (var i = 0; i < 4; i++)
            {
               bits |= (uint)(offsets[i] << (21 - (i * 3)));
            }
            bits |= length;
            Debug.WriteLine("{7}: {0} {1} {2}{3}{4}{5} {6}", Str, finger, offsets[0], offsets[1], offsets[2], offsets[3], length, note);
            return bits;
         }

         internal void AddRest()
         {
            length = 0;
         }

         public override string ToString()
         {
            return String.Format("Note : {7} String : {0} Finger : {1} Offsets : {2}{3}{4}{5} Length : {6}", Str, finger, offsets[0], offsets[1], offsets[2], offsets[3], length, note);
         }

      }

      internal class KeySignature
      {
         internal KeySignature(sbyte _sharps, bool _major)
         {
            Sharps = _sharps;
            Major = _major;
         }

         internal sbyte Sharps { get; }

         internal bool Major { get; }

         internal string GetString {
            get {
               string[] keyStrings = {
                        "Cb", "Gb", "Db", "Ab", "Eb", "Bb", "F", "C", "G", "D", "A", "E", "B", "F#", "C#"
                    };
               if (Major)
               {
                  return keyStrings[Sharps + 7] + " major";
               }
               else
               {
                  return keyStrings[(Sharps + 10) % 15] + " minor";
               }
            }
         }

         internal byte[,] GetNotes()
         {
            byte[,] keyNotes = new byte[,]
            {
               { 55, 57, 59, 60, 62 },
               { 62, 64, 65, 67, 69 },
               { 69, 71, 72, 74, 76 },
               { 76, 77, 79, 81, 83 },
               { 76, 84, 86, 88, 89 }
            };
            var seventh = (55 + 7 * Sharps) % 12;
            if (Sharps > 0)
            {
               var sig = 5;
               for (int i = 0; i < Sharps; i++)
               {
                  for (int j = 0; j < 5; j++)
                  {
                     for (int k = 1; k < 5; k++)
                     {
                        if (keyNotes[j, k] % 12 == sig)
                        {
                           keyNotes[j, k]++;
                        }
                        if (!Major && keyNotes[j, k] % 12 == seventh)
                        {
                           keyNotes[j, k]++;
                        }
                     }
                  }
                  sig = (sig + 7) % 12;
               }
            }
            else if (Sharps < 0)
            {
               var sig = 11;
               for (int i = 0; i < -Sharps; i++)
               {
                  for (int j = 0; j < 5; j++)
                  {
                     for (int k = 1; k < 5; k++)
                     {
                        if (keyNotes[j, k] % 12 == sig)
                        {
                           keyNotes[j, k]--;
                        }
                        if (!Major && keyNotes[j, k] % 12 == seventh)
                        {
                           keyNotes[j, k]++;
                        }
                     }
                  }
                  sig = (sig + 5) % 12;
               }
            }
            return keyNotes;
         }

         internal Note GetNote(byte n, ushort length, ref int prevString)
         {
            byte[,] keyNotes = GetNotes();
            // Try and find n in key notes
            int s = -1;
            int f = -1;

            for (var i = 0; i < 5 && s == -1; i++)
            {
               for (var j = 0; j < 5 && s == -1; j++)
               {
                  if (keyNotes[i,j] == n)
                  {
                     if (j == 4 && i < 4 && keyNotes[i+1,0] == n && (prevString == -1 || prevString != i))
                     {
                        s = i + 1;
                        f = 0;
                     } else
                     {
                        s = i;
                        f = j;
                     }
                  }
               }
            }

            if (s == -1)
            {
               // Find s and f through maths
               s = (n - 55) / 7;
               f = (((n - 55) % 7) + 1) / 2;
               keyNotes[s, f] = n;
            }

            keyNotes[4, 0] = 83;

            byte[] offsets = new byte[4];
            for (var i = 1; i < 5; i++)
            {
               offsets[i-1] = (byte) (keyNotes[s, i] - keyNotes[s, 0]);
            }

            prevString = s;

            return new Note(n, (byte)s, (byte)f, offsets, length);
         }

      }

      private List<Note> notes= new List<Note>();

      public Song (string fileName)
      {
         BinaryReader br;
         try
         {
            br = new BinaryReader(new FileStream(fileName, FileMode.Open));
         }
         catch (IOException e)
         {
            throw e;
         }
         catch (ArgumentException e)
         {
            throw e;
         }

         // Read header
         byte[] header = br.ReadBytes(14);
         string mthd = Encoding.ASCII.GetString(header, 0, 4);
         int headerLength = BitConverter.ToInt32(header.Skip(4).Take(4).Reverse().ToArray(), 0);
         short format = BitConverter.ToInt16(header.Skip(8).Take(2).Reverse().ToArray(), 0);
         short n = BitConverter.ToInt16(header.Skip(10).Take(2).Reverse().ToArray(), 0);
         short division = BitConverter.ToInt16(header.Skip(12).Take(2).Reverse().ToArray(), 0);

         Debug.WriteLine(mthd);
         Debug.WriteLine(headerLength);
         Debug.WriteLine(format);
         Debug.WriteLine(n);
         Debug.WriteLine(division);

         if (mthd != "MThd" || headerLength != 6)
         {
            br.Close();
            throw new Exception();
         }

         // Only read first chunk
         byte[] chunkHeader = br.ReadBytes(8);
         string mtrk = Encoding.ASCII.GetString(chunkHeader, 0, 4);
         int chunkLength = BitConverter.ToInt32(chunkHeader.Skip(4).Take(4).Reverse().ToArray(), 0);

         Debug.WriteLine(mtrk);
         Debug.WriteLine(chunkLength);

         if (mtrk != "MTrk")
         {
            br.Close();
            throw new Exception();
         }

         byte[] chunk = br.ReadBytes(chunkLength);
         int offset = 0;
         bool noteOn = false;
         bool endOfTrack = false;

         int tempo = 0; // microseconds per quarter note
         int timeSig = 0; // quarter notes per bar
         KeySignature keySig = new KeySignature(0, true); // Initally C Major

         byte[] noteValues = new byte[128];
         byte[] oldValues = new byte[128];

         int reftime = 0; // Time when current time signature first started
         int ctime = 0; // Current time of track
         int ltime = 0; // Time of last change

         bool notesChanged = false;

         int prevString = -1;

         while (offset < chunkLength && !endOfTrack)
         {
            int delta = GetVarLength(chunk, ref offset);
            if (delta > 0 && notesChanged)
            {

               // Create a chord out of currently played notes
               int dtime = ctime - ltime;
               int dur = (int)Math.Round(24 * (double)dtime / division);
               Debug.WriteLine("ctime: {0} ltime: {1}", ctime, ltime);
               if (dur > 0)
               {
                  try
                  {
                     byte note = oldValues.Select((s, i) => new { i, s }).Where(t => t.s > 0).Select(t => (byte)t.i).Max();
                     int len = dur * tempo / 24000;
                     if (len > 4095) len = 4095;
                     notes.Add(keySig.GetNote(note, (ushort)len, ref prevString));
                  } catch {
                  }
               }

               Array.Copy(noteValues, oldValues, 128);

               notesChanged = false;
               ltime = ctime;
            }
            ctime += delta;

            // Debug.WriteLine(String.Format("Time delta: {0}", delta));
            byte message = chunk[offset];
            offset++;
            if (message == 0xFF)
            {
               // Meta event
               byte metaType = chunk[offset++];
               int vlen = GetVarLength(chunk, ref offset);
               byte[] vData = chunk.Skip(offset).Take(vlen).ToArray();
               offset += vlen;
               switch (metaType)
               {
                  case 0x00:
                     // Sequence number
                     short seqNum = BitConverter.ToInt16(vData.Reverse().ToArray(), 0);
                     Debug.WriteLine(string.Format("Sequence number: {0}", seqNum));
                     ltime = ctime;
                     break;
                  case 0x01:
                     // Text event
                     Debug.WriteLine(string.Format("Text: {0}", Encoding.ASCII.GetString(vData)));
                     break;
                  case 0x02:
                     // Copyright notice
                     Debug.WriteLine(string.Format("Copyright: {0}", Encoding.ASCII.GetString(vData)));
                     break;
                  case 0x03:
                     // Sequence or track name
                     Debug.WriteLine(string.Format("Sequence Name: {0}", Encoding.ASCII.GetString(vData)));
                     break;
                  case 0x04:
                     // Instrument name
                     Debug.WriteLine(string.Format("Instrument Name: {0}", Encoding.ASCII.GetString(vData)));
                     break;
                  case 0x05:
                     // Lyric text
                     Debug.WriteLine(string.Format("Lyric: {0}", Encoding.ASCII.GetString(vData)));
                     break;
                  case 0x06:
                     // Marker text
                     Debug.WriteLine(string.Format("Marker: {0}", Encoding.ASCII.GetString(vData)));
                     break;
                  case 0x07:
                     // Cue point
                     Debug.WriteLine(string.Format("Cue Point: {0}", Encoding.ASCII.GetString(vData)));
                     break;
                  case 0x20:
                     // MIDI channel prefix assignment
                     byte channel = vData[0];
                     Debug.WriteLine(string.Format("MIDI Channel Prefix: {0}", channel));
                     break;
                  case 0x2F:
                     // End of track
                     endOfTrack = true;
                     Debug.WriteLine("End of track");
                     if (notes.Count > 0)
                     {
                        Note lastNote = notes[notes.Count - 1];
                        lastNote.AddRest();
                        notes[notes.Count - 1] = lastNote;
                     }
                     break;
                  case 0x51:
                     // Tempo setting
                     tempo = BitConverter.ToInt32(vData.Reverse().Concat(new byte[] { 0 }).ToArray(), 0);
                     Debug.WriteLine(string.Format("Tempo: {0}", tempo));
                     break;
                  case 0x54:
                     // SMPTE offset
                     byte hr = vData[0];
                     byte mn = vData[1];
                     byte se = vData[2];
                     byte fr = vData[3];
                     byte ff = vData[4];
                     Debug.WriteLine(string.Format("SMPTE offset: hr:{0} mn:{1} se:{2} fr:{3} ff:{4}", hr, mn, se, fr, ff));
                     break;
                  case 0x58:
                     // Time signature
                     byte nn = vData[0];
                     byte dd = vData[1];
                     byte cc = vData[2];
                     byte bb = vData[3];
                     Debug.WriteLine(string.Format("Time signature: {0}/{1}", nn, Math.Pow(2, dd)));
                     Debug.WriteLine(string.Format("MIDI clocks per metronome tick: {0}", cc));
                     Debug.WriteLine(string.Format("32nd notes per MIDI quarter note: {0}", bb));
                     timeSig = (int)(nn * Math.Pow(2, 2 - dd));
                     reftime = ctime;
                     break;
                  case 0x59:
                     sbyte sf = (sbyte)vData[0];
                     bool major = (vData[1] == 0);
                     // Key signature
                     keySig = new KeySignature(sf, major);
                     Debug.WriteLine(string.Format("Key signature: {0}", keySig.GetString));
                     break;
                  case 0x7F:
                     // Sequencer specific event
                     Debug.WriteLine(string.Format("Sequence specifier: {0}", BitConverter.ToString(vData)));
                     break;
                  default:
                     // Unknown event type
                     Debug.WriteLine("Unknown event type: {0} Len: {1} Data: {2}", metaType, vlen, BitConverter.ToString(vData));
                     break;
               }

            }
            else if (message == 0xF0 || message == 0xF7)
            {
               // Sysex event
               int vlen = GetVarLength(chunk, ref offset);
               byte[] vData = chunk.Skip(offset).Take(vlen).ToArray();
               offset += vlen;
               Debug.WriteLine("Sysex event: Len: {0} Data: {1}", vlen, BitConverter.ToString(vData));
            }
            else
            {
               byte status = (byte)(message & 0xF0);
               byte channel = (byte)(message & 0x0F);
               byte key, val;
               switch (status)
               {
                  case 0x80:
                     // Note off event
                     noteOn = false;
                     key = (byte)(chunk[offset] & 0x7F);
                     offset++;
                     val = (byte)(chunk[offset] & 0x7F);
                     offset++;
                     Debug.WriteLine("Note off: Key: {0} Vol: {1}", key, val);
                     if (channel == 0)
                     {
                        noteValues[key] = 0;
                     }
                     notesChanged = true;
                     break;
                  case 0x90:
                     // Note on event
                     noteOn = true;
                     key = (byte)(chunk[offset] & 0x7F);
                     offset++;
                     val = (byte)(chunk[offset] & 0x7F);
                     offset++;
                     Debug.WriteLine("Note on: Key: {0} Vl: {1}", key, val);
                     if (channel == 0)
                     {
                        noteValues[key] = val;
                     }
                     notesChanged = true;
                     break;
                  case 0xA0:
                     noteOn = false;
                     // Polyphonic key pressure
                     key = (byte)(chunk[offset] & 0x7F);
                     offset++;
                     val = (byte)(chunk[offset] & 0x7F);
                     offset++;
                     Debug.WriteLine("Polyphonic key pressure: Key: {0} Pressure value: {1}", key, val);
                     break;
                  case 0xB0:
                     noteOn = false;
                     // Control change
                     byte controller = (byte)(chunk[offset] & 0x7F);
                     offset++;
                     val = (byte)(chunk[offset] & 0x7F);
                     offset++;
                     Debug.WriteLine("Control change: Controller number: {0} Vel: {1}", controller, val);
                     break;
                  case 0xC0:
                     noteOn = false;
                     // Program change
                     byte program = (byte)(chunk[offset] & 0x7F);
                     offset++;
                     Debug.WriteLine("Program change: {0}", program);
                     break;
                  case 0xD0:
                     noteOn = false;
                     // Channel pressure
                     val = (byte)(chunk[offset] & 0x7F);
                     offset++;
                     Debug.WriteLine("Channel pressure: {0}", val);
                     break;
                  case 0xE0:
                     noteOn = false;
                     // Pitch Wheel Change
                     short wheel = (short)((chunk[offset] & 0x7F) | ((chunk[offset + 1] & 0x7F) << 7));
                     offset += 2;
                     Debug.WriteLine("Pitch wheel change: {0}", wheel);
                     break;
                  default:
                     if (noteOn)
                     {
                        // Part of note on event
                        key = (byte)(message & 0x7F);
                        val = (byte)(chunk[offset] & 0x7F);
                        offset++;
                        Debug.WriteLine("Update note value: Key: {0} Vel: {1}", key, val);
                        noteValues[key] = val;
                        notesChanged = true;
                     }
                     else
                     {
                        // Unknown message type
                        Debug.WriteLine("Unknown message type: {0} Data: {1}", message, chunk[offset]);
                        offset++;
                     }
                     break;
               }
            }

         }

         br.Close();
      }

      public byte[] GetData()
      {
         var ret = new byte[4 * notes.Count];
         var data = notes.Select(n => n.Format()).ToArray();
         Buffer.BlockCopy(data, 0, ret, 0, ret.Length);
         return ret;
      }

      public string[] GetDataStrings()
      {
         return notes.Select(n => n.ToString()).ToArray();
      }

      // Returns value directly, offset by reference
      static private int GetVarLength(byte[] data, ref int offset)
      {
         int result = 0;
         while (true)
         {
            byte val = data[offset++];
            result = (result << 7) | (val & 0x7F);
            if ((val & (1 << 7)) == 0)
            {
               return result;
            }
         }
      }

   }
}
