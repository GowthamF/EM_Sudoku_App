import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

part 'user_name_generate_event.dart';
part 'user_name_generate_state.dart';

class UserNameGenerateBloc
    extends Bloc<UserNameGenerateEvent, UserNameGenerateState> {
  final UserNameGeneratorRepository userNameGeneratorRepository;

  UserNameGenerateBloc({required this.userNameGeneratorRepository})
      : super(UserNameGenerateInitial()) {
    on<GenerateUserName>(_onGenerateUserName);
  }

  FutureOr<void> _onGenerateUserName(
      GenerateUserName event, Emitter<UserNameGenerateState> emit) async {
    emit(UserNameGenerateLoading());

    var userName = await userNameGeneratorRepository.generateUserName();

    emit(UserNameGenerateLoaded(userName: userName.userName));
  }
}
