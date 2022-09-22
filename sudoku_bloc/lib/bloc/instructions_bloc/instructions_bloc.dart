import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

part 'instructions_event.dart';
part 'instructions_state.dart';

class InstructionsBloc extends Bloc<InstructionsEvent, InstructionsState> {
  final SharedPreferenceRepository sharedPreferenceRepository;
  InstructionsBloc({required this.sharedPreferenceRepository})
      : super(InstructionsInitial()) {
    on<GetInstructions>(_onGetInstructionsEvent);
  }

  FutureOr<void> _onGetInstructionsEvent(
      GetInstructions event, Emitter<InstructionsState> emit) async {
    var instruction =
        await sharedPreferenceRepository.getBool(key: instructionKey);

    if (instruction == null) {
      emit(InstructionsNotNotified());
      await sharedPreferenceRepository.setBool(
          key: instructionKey, value: true);
    } else {
      emit(InstructionsNotified());
    }
  }
}
