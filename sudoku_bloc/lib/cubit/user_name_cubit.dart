import 'package:bloc/bloc.dart';

class UserNameCubit extends Cubit<String?> {
  UserNameCubit() : super(null);

  void changeUserName(String userName) {
    emit(userName);
  }
}

class CountryNameCubit extends Cubit<String?> {
  CountryNameCubit() : super(null);

  void changeCountryName(String countryName) {
    emit(countryName);
  }
}

class UserIdCubit extends Cubit<String?> {
  UserIdCubit() : super(null);

  void changeUserId(String userId) {
    emit(userId);
  }
}
