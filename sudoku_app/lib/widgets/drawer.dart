import 'package:flutter/material.dart';

class Drawer extends StatefulWidget {
  const Drawer({Key? key}) : super(key: key);

  @override
  State<Drawer> createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(
          height: 125,
          child: DrawerHeader(
            margin: EdgeInsets.only(bottom: 8),
            padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
            child: ListTile(
              leading: CircleAvatar(
                foregroundColor: Colors.black,
                backgroundImage: NetworkImage('https://robohash.org/adadad'),
              ),
              title: Text('DDD'),
            ),
          ),
        ),
        ListTile(
          title: const Text('Play'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Restart'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Leaderboard'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Profile'),
          onTap: () {},
        ),
      ],
    );
  }
}
