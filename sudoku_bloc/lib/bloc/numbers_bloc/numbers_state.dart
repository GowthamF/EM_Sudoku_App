part of 'numbers_bloc.dart';

abstract class NumbersState {}

class NumbersInitial extends NumbersState {}

class NumbersGenerating extends NumbersState {}

class NumbersGenerated extends NumbersState {
  final List<List<int>> numbers;

  NumbersGenerated({required this.numbers});
}
