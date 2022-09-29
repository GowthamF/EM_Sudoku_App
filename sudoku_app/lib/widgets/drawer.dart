import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudoku_app/sudoku_app.dart';
import 'package:sudoku_app/widgets/profile_screen.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Drawer extends StatefulWidget {
  const Drawer({Key? key}) : super(key: key);

  @override
  State<Drawer> createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  String? userName;
  late ThemeBloc _themeBloc;
  final List<Widget> icons = [
    Icon(Icons.looks_one_outlined),
    Icon(Icons.looks_two_outlined),
    Icon(Icons.looks_3_outlined)
  ];

  @override
  void initState() {
    super.initState();
    userName = context.read<UserNameCubit>().state;
    _themeBloc = BlocProvider.of<ThemeBloc>(context);
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
            child: Row(
              children: [
                Expanded(
                  flex: 2,
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
                    subtitle: BlocBuilder<LocationBloc, LocationState>(
                      builder: (context, state) {
                        if (state is LocationLoaded) {
                          return Row(
                            children: [
                              const Icon(Icons.place_outlined, size: 14),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(state.countryName),
                            ],
                          );
                        }

                        return const SizedBox();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<ThemeCubit, bool>(
                    builder: (context, state) {
                      return Switch(
                        value: state,
                        onChanged: (value) {
                          context.read<ThemeCubit>().changeTheme(value);
                          _themeBloc.add(SaveThemeData(isDarkTheme: value));
                        },
                        activeThumbImage:
                            const AssetImage('assets/images/dark_theme.png'),
                        inactiveThumbImage:
                            const AssetImage('assets/images/light_theme.png'),
                      );
                    },
                  ),
                ),
              ],
            ),
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
                  canTapOnHeader: true,
                  backgroundColor: Colors.transparent,
                  headerBuilder: (contex, isExpanded) {
                    return const ListTile(
                      title: Text('Levels'),
                    );
                  },
                  body: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      children: List.generate(
                        Levels.values.length,
                        (index) => ListTile(
                          leading: icons[index],
                          selected: context.read<LevelCubit>().state ==
                              Levels.values[index],
                          title: Text(
                            Levels.values[index].name.getName(),
                          ),
                          onTap: () async {
                            Navigator.pop(context);
                            context
                                .read<LevelsChangeCubit>()
                                .changeLevels(Levels.values[index]);
                            context
                                .read<LevelCubit>()
                                .changeLevel(Levels.values[index]);
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ],
              elevation: 0,
            );
          },
        ),
        ListTile(
          title: const Text('Leaderboard'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const LeaderBoardScreen())));
          },
        ),
        ListTile(
          title: const Text('My Profile'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const ProfileScreen())));
          },
        ),
      ],
    );
  }
}
