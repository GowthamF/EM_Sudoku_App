import 'package:bloc/bloc.dart';

class UserNameCubit extends Cubit<String?> {
  UserNameCubit() : super(null);

  void changeUserName(String userName) {
    emit(userName);
  }
}
