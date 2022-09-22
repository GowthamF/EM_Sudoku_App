import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudoku_app/sudoku_app.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ThemeBloc _themeBloc;

  @override
  void initState() {
    super.initState();
    _themeBloc = BlocProvider.of<ThemeBloc>(context);

    _themeBloc.add(GetThemeData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeBloc, ThemeState>(
      listener: (context, state) {
        if (state is ThemeLoaded) {
          context.read<ThemeCubit>().changeTheme(state.isDarkTheme);
        }
      },
      builder: (context, state) {
        if (state is ThemeLoaded) {
          return BlocBuilder<ThemeCubit, bool>(
            builder: (context, state) {
              return MaterialApp(
                darkTheme: ThemeData.dark(),
                theme: ThemeData(),
                themeMode: state ? ThemeMode.dark : ThemeMode.light,
                home: const Home(),
              );
            },
          );
        }
        return Container(
          color: Theme.of(context).primaryColor,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
