import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

part 'user_name_generate_event.dart';
part 'user_name_generate_state.dart';

class UserNameGenerateBloc
    extends Bloc<UserNameGenerateEvent, UserNameGenerateState> {
  final UserNameGeneratorRepository userNameGeneratorRepository;
  final SharedPreferenceRepository sharedPreferenceRepository;

  UserNameGenerateBloc(
      {required this.userNameGeneratorRepository,
      required this.sharedPreferenceRepository})
      : super(UserNameGenerateInitial()) {
    on<GenerateUserName>(_onGenerateUserName);
  }

  FutureOr<void> _onGenerateUserName(
      GenerateUserName event, Emitter<UserNameGenerateState> emit) async {
    emit(UserNameGenerateLoading());

    var existUserName =
        await sharedPreferenceRepository.getString(key: userNameKey);

    if (existUserName != null && existUserName.isNotEmpty) {
      emit(UserNameGenerateLoaded(userName: existUserName));
    } else {
      var userName = await userNameGeneratorRepository.generateUserName();

      await sharedPreferenceRepository.setString(
          key: userNameKey, value: userName.userName);

      emit(UserNameGenerateLoaded(userName: userName.userName));
    }
  }
}
