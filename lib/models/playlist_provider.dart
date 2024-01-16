import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player_ui/models/song.dart';

class PlayListProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playList = [
    Song(
      songName: 'Astronaut In The Ocean',
      artistName: 'Masked Wolf',
      albumImagePath: 'assets/firstImage.jpg',
      audioPath: 'audio/song.mp3',
    ),

    //song 2
    Song(
      songName: 'Taliban Reenolt',
      artistName: 'J Nevas',
      albumImagePath: 'assets/thirdImage.jpg',
      audioPath: 'audio/song.mp3',
    ),

    //song3
    Song(
      songName: 'Greed With Envy',
      artistName: 'Wayne Dapolt',
      albumImagePath: 'assets/secondImage.jpg',
      audioPath: 'audio/song5.mp3',
    ),
    Song(
      songName: 'Juice Lintolp',
      artistName: 'Rising Star',
      albumImagePath: 'assets/fourthImage.jpg',
      audioPath: 'audio/song4.mp3',
    ),
    Song(
      songName: 'Taliban Reenolt',
      artistName: 'J Nevas',
      albumImagePath: 'assets/fifthImage.jpg',
      audioPath: 'audio/song2.mp3',
    ),
    Song(
      songName: 'Envy Latite',
      artistName: 'Nkay',
      albumImagePath: 'assets/blob.jpeg',
      audioPath: 'audio/song1.mp3',
    ),
  ];

// current song playing index
  int? _currentSongIndex;

/*getters*/

  final AudioPlayer _audioPlayer = AudioPlayer();

//durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //initially not playing
  bool _isPlaying = false;

  //play the song
  void play() async {
    final String path = _playList[currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

//pause the song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause or resyme
  void pauseOrResume() {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

//seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

//play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playList.length - 1) {
        //go to the next song if its not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        //if its the last song go to the firstt song
        currentSongIndex = 0;
      }
    }
  }

  //play previousSong
  void playPreviousSong() async {
    //if more than 2 seconds passed restart the song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    }
    //if its within the first 2 sevconds
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = _playList.length - 1;
      }
    }
  }

  //constructor
  PlayListProvider() {
    //listen to audio player changes
    listenToDuration();
  }

//listen to duartion
  void listenToDuration() {
    //listen To Total Duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //listen to current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    //listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  List<Song> get playList => _playList;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

/*setters*/

  set currentSongIndex(int? newIndex) {
    //update current Song index
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      //play song at new index
      play();
    }

    //update ui
    notifyListeners();
  }
}
