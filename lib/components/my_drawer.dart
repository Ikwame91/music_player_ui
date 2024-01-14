import 'package:flutter/material.dart';
import 'package:music_player_ui/pages/settingspage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //logo
          DrawerHeader(
              child: Center(
            child: Icon(
              Icons.music_note,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 50,
            ),
          )),

          Padding(
            padding: const EdgeInsets.only(left: 20, top: 25),
            child: ListTile(
              leading: Icon(Icons.home,
                  color: Theme.of(context).colorScheme.inversePrimary),
              title: const Text('H O M E'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 25),
            child: ListTile(
              leading: Icon(Icons.settings,
                  color: Theme.of(context).colorScheme.inversePrimary),
              title: const Text('S E T T I N G S'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
