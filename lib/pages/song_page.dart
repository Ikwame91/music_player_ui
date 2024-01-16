import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player_ui/components/nuephormism_box.dart';
import 'package:music_player_ui/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayListProvider>(
      builder: (context, value, child) {
        //get playlist
        final playlist = value.playList;

        //get current song index
        final currentSong = playlist[value.currentSongIndex ?? 0];

        //return scaffold ui
        return SafeArea(
          child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.primary,
              body: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Back button
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),

                        //Text
                        const Text(
                          'P L A Y L I S T',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        //menu8 button
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu),
                        ),
                      ],
                    ),
                    NeuBox(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Column(
                          children: [
                            Image.asset(currentSong.albumImagePath),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(currentSong.songName,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .inversePrimary,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                      Text(
                                        currentSong.artistName,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //heart Icon
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("0:00"),
                              Icon(Icons.shuffle),
                              Icon(Icons.repeat),
                              Text("3:00"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 5,
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 5,
                            ),
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 10,
                            ),
                          ),
                          child: Slider(
                            min: 0,
                            max: 100,
                            value: 50,
                            activeColor: Colors.green,
                            onChanged: (value) {},
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: const NeuBox(
                              child: Icon(Icons.skip_previous),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {},
                              child: const NeuBox(
                                child: Icon(Icons.play_arrow),
                              ),
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {},
                          child: const NeuBox(
                            child: Icon(Icons.skip_next),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
