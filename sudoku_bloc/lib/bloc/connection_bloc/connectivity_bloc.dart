import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:open_settings/open_settings.dart' as settings;
import 'package:sudoku_bloc/sudoku_bloc.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final SharedPreferenceRepository sharedPreferenceRepository;
  ConnectivityBloc({required this.sharedPreferenceRepository})
      : super(ConnectivityInitial()) {
    on<GetConnection>(_onGetConnectionEvent);
    on<OpenSettings>(_onOpenSettingsEvent);
  }

  FutureOr<void> _onGetConnectionEvent(
      GetConnection event, Emitter<ConnectivityState> emit) async {
    emit(ConnectivityLoading());

    var isKeyAvailable =
        await sharedPreferenceRepository.containsKey(key: userNameKey);

    if (isKeyAvailable) {
      emit(ConnectivityLoaded());
    } else {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        emit(ConnectivityLoaded());
      } else {
        emit(ConnectivityNotAvaialble());
      }
    }
  }

  FutureOr<void> _onOpenSettingsEvent(
      OpenSettings event, Emitter<ConnectivityState> emit) async {
    await settings.OpenSettings.openWIFISetting();
  }
}
