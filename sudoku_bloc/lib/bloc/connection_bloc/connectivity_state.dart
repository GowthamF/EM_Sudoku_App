part of 'connectivity_bloc.dart';

abstract class ConnectivityState {}

class ConnectivityInitial extends ConnectivityState {}

class ConnectivityLoading extends ConnectivityState {}

class ConnectivityLoaded extends ConnectivityState {}

class ConnectivityNotAvaialble extends ConnectivityState {}
