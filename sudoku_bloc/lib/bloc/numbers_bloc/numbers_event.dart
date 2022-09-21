part of 'numbers_bloc.dart';

abstract class NumbersEvent {}

class GenerateNumbers extends NumbersEvent {
  final Levels selectedLevel;

  GenerateNumbers({required this.selectedLevel});
}
