using Microsoft.Win32;
using System;
using System.IO;
using System.Windows;

namespace TVLoader
{
   /// <summary>
   /// Interaction logic for MainWindow.xaml
   /// </summary>
   public partial class MainWindow : Window
   {
      public MainWindow()
      {
         InitializeComponent();
      }

      public void BtnBrowseMidi_OnClick(object sender, RoutedEventArgs e) {
         OpenFileDialog openFileDialog = new OpenFileDialog();
         openFileDialog.Filter = "MIDI files (*.mid;*.midi)|*.mid;*.midi";
         if (openFileDialog.ShowDialog() == true)
         {
            var fileName = openFileDialog.FileName;
            if (fileName.EndsWith(".mid") || fileName.EndsWith(".midi"))
            {
               // Display filename in textbox
               var fileUri = new Uri(fileName);
               var referenceUri = new Uri(Directory.GetCurrentDirectory());
               var relFileName = referenceUri.MakeRelativeUri(fileUri).ToString();
               if (relFileName.StartsWith(".."))
               {
                  midiFileNameBox.Text = fileName;
               }
               else
               {
                  midiFileNameBox.Text = relFileName;
               }
            }
            else
            {
               MessageBox.Show("Please specify a MIDI file", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
         }
      }

      public void BtnBrowseOutput_OnClick(object sender, RoutedEventArgs e) {
         SaveFileDialog saveFileDialog = new SaveFileDialog();
         if (saveFileDialog.ShowDialog() == true)
         {
            var fileName = saveFileDialog.FileName;
            // Display filename in textbox
            var fileUri = new Uri(fileName);
            var referenceUri = new Uri(Directory.GetCurrentDirectory());
            var relFileName = referenceUri.MakeRelativeUri(fileUri).ToString();
            if (relFileName.StartsWith(".."))
            {
               outputFileNameBox.Text = fileName;
            }
            else
            {
               outputFileNameBox.Text = relFileName;
            }
         }
      }

      public void Text_OnChange(object sender, RoutedEventArgs e)
      {
         loadButton.IsEnabled = midiFileNameBox.Text.Length > 0 && outputFileNameBox.Text.Length > 0;
      }

      public void BtnLoad_OnClick(object sender, RoutedEventArgs e) {
         string midiFile = midiFileNameBox.Text;
         string outputFile = outputFileNameBox.Text;
         if (midiFile.Length == 0 || !(midiFile.EndsWith(".mid") || midiFile.EndsWith(".midi")))
         {
            // Throw error message
            MessageBox.Show("Please specify a MIDI file", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            return;
         }

         if (outputFile.Length == 0)
         {
            // Throw error message
            MessageBox.Show("Please specify an output file", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            return;
         }

         Song song;

         try
         {
            song = new Song(midiFile);
         }
         catch (IOException)
         {
            MessageBox.Show("Could not open MIDI file", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            return;
         }
         catch (FileFormatException)
         {
            MessageBox.Show("Error reading MIDI file", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
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
            MessageBox.Show("Could not open output file", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            return;
         }
         finally
         {
            if (bw != null) bw.Close();
         }

      }

   }
}
