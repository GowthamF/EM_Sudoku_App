import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final SharedPreferenceRepository sharedPreferenceRepository;

  LocationBloc({required this.sharedPreferenceRepository})
      : super(LocationInitial()) {
    on<GetLocationAddress>(_onGetLocationAddressEvent);
  }

  FutureOr<void> _onGetLocationAddressEvent(
      GetLocationAddress event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    var country = await sharedPreferenceRepository.getString(key: locationKey);

    if (country != null) {
      emit(LocationLoaded(countryName: country));
    } else {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        await Geolocator.requestPermission();
      }
      var currentLocation = await Geolocator.getCurrentPosition();

      var locationAddress = await placemarkFromCoordinates(
          currentLocation.latitude, currentLocation.longitude);

      await sharedPreferenceRepository.setString(
          key: locationKey, value: locationAddress.first.country ?? '');

      emit(LocationLoaded(countryName: locationAddress.first.country ?? ''));
    }
  }
}
