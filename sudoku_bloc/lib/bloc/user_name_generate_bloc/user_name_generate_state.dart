part of 'user_name_generate_bloc.dart';

abstract class UserNameGenerateState {}

class UserNameGenerateInitial extends UserNameGenerateState {}

class UserNameGenerateLoading extends UserNameGenerateState {}

class UserNameGenerateLoaded extends UserNameGenerateState {
  final String userName;

  UserNameGenerateLoaded({required this.userName});
}
