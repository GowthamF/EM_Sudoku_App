import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Drawer extends StatefulWidget {
  const Drawer({Key? key}) : super(key: key);

  @override
  State<Drawer> createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  String? userName;

  @override
  void initState() {
    super.initState();
    userName = context.read<UserNameCubit>().state;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 125,
          child: DrawerHeader(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black54,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white70,
                  backgroundImage: CachedNetworkImageProvider(
                    'https://robohash.org/$userName!',
                  ),
                ),
              ),
              title: Text(userName!),
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Dark Theme',
          ),
          leading: Switch(
            value: false,
            activeColor: Color(0xFF6200EE),
            onChanged: (value) {},
          ),
        ),
        BlocBuilder<LevelsCubit, bool>(
          builder: (context, state) {
            return ExpansionPanelList(
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (panelIndex, isExpanded) {
                context.read<LevelsCubit>().hasExpanded();
              },
              children: [
                ExpansionPanel(
                  isExpanded: state,
                  backgroundColor: Colors.transparent,
                  headerBuilder: (contex, isExpanded) {
                    return const ListTile(
                      title: Text('Levels'),
                    );
                  },
                  body: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      children: const [
                        ListTile(
                          title: Text('Easy'),
                        ),
                        ListTile(
                          title: Text('Medium'),
                        ),
                        ListTile(
                          title: Text('Hard'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
              elevation: 0,
            );
          },
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
