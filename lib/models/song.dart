class Song {
  final String songName;
  final String artistName;
  final String albumImagePath;
  final String audioPath;
  bool isFavorite;

  Song(
      {required this.songName,
      required this.artistName,
      required this.albumImagePath,
      this.isFavorite = false,
      required this.audioPath});
}
