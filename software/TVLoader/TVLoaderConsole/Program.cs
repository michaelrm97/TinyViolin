using System;
using System.IO;
using System.Linq;

namespace TVLoaderConsole
{
   class Program
   {
      static void Main(string[] args)
      {

         bool verbose = false;

         if (args.Contains("-v"))
         {
            verbose = true;
            args = args.Where(val => val != "-v").ToArray();
         }

         if (args.Length < 2)
         {
            Console.WriteLine("Please specify input and output file");
            return;
         }

         string inputFile = args[0];
         string outputFile = args[1];

         if (!(inputFile.EndsWith(".mid") || inputFile.EndsWith(".midi")))
         {
            Console.WriteLine("Please specify a midi file as input");
            return;
         }

         Song song;

         try
         {
            song = new Song(inputFile);
         }
         catch (IOException)
         {
            Console.WriteLine("Could not open MIDI file");
            return;
         }
         catch
         {
            Console.WriteLine("Error reading MIDI file");
            return;
         }

         BinaryWriter bw = null;

         try
         {
            bw = new BinaryWriter(new FileStream(outputFile, FileMode.Create));
            bw.Write(song.GetData());
         }
         catch (IOException)
         {
            Console.WriteLine("Could not open output file");
            return;
         }
         finally
         {
            if (bw != null) bw.Close();
         }

         if (verbose)
         {
            foreach(var s in song.GetDataStrings()) {
               Console.WriteLine(s);
            }
         }

      }
   }
}
