import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player_ui/components/my_drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            'P L A Y L I S T ',
            style: GoogleFonts.bebasNeue(
              textStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              letterSpacing: 2,
            ),
          ),
          centerTitle: true,
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
