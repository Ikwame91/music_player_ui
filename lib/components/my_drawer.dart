import 'package:flutter/material.dart';

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
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 25),
            child: ListTile(
              leading: Icon(Icons.home,
                  color: Theme.of(context).colorScheme.inversePrimary),
              title: const Text('H O M E'),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
