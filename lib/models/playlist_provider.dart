import 'package:flutter/material.dart';
import 'package:music_player_ui/models/song.dart';

class PlayListProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playList = [
    Song(
      songName: 'Astronaut In The Ocean',
      artistName: 'Masked Wolf',
      albumImagePath: 'assets/firstImage.jpg',
      audioPath: 'assets/icon2.jpg',
    ),

    //song 2
    Song(
      songName: 'Taliban Reenolt',
      artistName: 'J Nevas',
      albumImagePath: 'assets/thirdImage.jpg',
      audioPath: 'assets/icon2.jpg',
    ),

    //song3
    Song(
      songName: 'Greed With Envy',
      artistName: 'Wayne Dapolt',
      albumImagePath: 'assets/secondImage.jpg',
      audioPath: 'assets/icon2.jpg',
    ),
  ];

// current song playing index
  int? _currentSongIndex;

/*getters*/

  List<Song> get playList => _playList;
  int? get currentSongIndex => _currentSongIndex;

/*setters*/

  set currentSongIndex(int? newIndex) {
    //update current Song index
    _currentSongIndex = newIndex;

    //update ui
    notifyListeners();
  }

  // List<String> get playList => _playList;

  // void addSong(String song) {
  //   _playList.add(song);
  //   notifyListeners();
  // }

  // void removeSong(String song) {
  //   _playList.remove(song);
  //   notifyListeners();
  // }
}
