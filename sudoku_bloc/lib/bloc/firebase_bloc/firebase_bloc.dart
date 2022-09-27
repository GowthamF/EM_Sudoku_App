import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';
part 'firebase_event.dart';
part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  final FirebaseRepository firebaseRepository;
  FirebaseBloc({required this.firebaseRepository}) : super(FirebaseInitial()) {
    on<InitializeFirebase>(_onInitializeFirebaseEvent);
  }

  FutureOr<void> _onInitializeFirebaseEvent(
      InitializeFirebase event, Emitter<FirebaseState> emit) async {
    emit(FirebaseLoading());
    await firebaseRepository.connectToFirebase();
    emit(FirebaseLoaded());
  }
}
