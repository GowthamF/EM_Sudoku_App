import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginAnonymous>(_onLoginAnonymousEvent);
  }

  FutureOr<void> _onLoginAnonymousEvent(
      LoginAnonymous event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await authRepository.signInAnonymously();
    emit(AuthLoaded());
  }
}
