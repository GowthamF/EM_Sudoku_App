part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent {}

class GetConnection extends ConnectivityEvent {}

class OpenSettings extends ConnectivityEvent {}
