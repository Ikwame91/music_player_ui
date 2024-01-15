import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player_ui/components/my_drawer.dart';
import 'package:music_player_ui/models/playlist_provider.dart';
import 'package:music_player_ui/models/song.dart';
import 'package:music_player_ui/pages/song_page.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //get playlist provider
  late final dynamic playListProvider;

  @override
  void initState() {
    super.initState();
    //get playlist provider
    playListProvider = Provider.of<PlayListProvider>(context, listen: false);
  }

  //got to song
  void goToSong(int songIndex) {
    //update current song index
    playListProvider.currentSongIndex = songIndex;

    //go to song page
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SongPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'P L A Y L I S T ',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
              letterSpacing: 1,
            ),
          ),
          centerTitle: true,
        ),
        drawer: const MyDrawer(),
        body: Consumer<PlayListProvider>(builder: ((context, value, child) {
          //get the playlist
          final List<Song> playList = value.playList;
          return ListView.builder(
              itemCount: playList.length,
              itemBuilder: ((context, index) {
                final Song song = playList[index];
                return ListTile(
                  onTap: () {
                    //go to song
                    goToSong(index);
                  },
                  horizontalTitleGap: 20.0,
                  contentPadding: const EdgeInsets.only(
                      top: 10, left: 20, bottom: 10, right: 20),
                  leading: Image.asset(
                    song.albumImagePath,
                  ),
                  title: Text(song.songName,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  subtitle: Text(
                    song.artistName,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // trailing: IconButton(
                  //   icon: const Icon(Icons.play_arrow),
                  //   onPressed: () {
                  //     //play the song
                  //   },
                  // ),
                );
              }));
        })),
      ),
    );
  }
}
