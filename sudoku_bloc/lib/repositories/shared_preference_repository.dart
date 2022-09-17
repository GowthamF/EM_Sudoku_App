import 'package:sudoku_bloc/services/shared_preference_service.dart';

class SharedPreferenceRepository {
  final SharedPreferenceService _sharedPreferenceService =
      SharedPreferenceService();

  Future<bool> setBool({required String key, required bool value}) {
    return _sharedPreferenceService.setBool(key: key, value: value);
  }

  Future<bool> setDouble({required String key, required double value}) {
    return _sharedPreferenceService.setDouble(key: key, value: value);
  }

  Future<bool> setInt({required String key, required int value}) {
    return _sharedPreferenceService.setInt(key: key, value: value);
  }

  Future<bool> setString({required String key, required String value}) {
    return _sharedPreferenceService.setString(key: key, value: value);
  }

  Future<bool> setStringList(
      {required String key, required List<String> value}) {
    return _sharedPreferenceService.setStringList(key: key, value: value);
  }

  Future<bool?> getBool({required String key}) {
    return _sharedPreferenceService.getBool(key: key);
  }

  Future<double?> getDouble({required String key}) {
    return _sharedPreferenceService.getDouble(key: key);
  }

  Future<int?> getInt({required String key}) {
    return _sharedPreferenceService.getInt(key: key);
  }

  Future<String?> getString({required String key}) {
    return _sharedPreferenceService.getString(key: key);
  }

  Future<List<String>?> getStringList({required String key}) {
    return _sharedPreferenceService.getStringList(key: key);
  }

  Future<bool> containsKey({required String key}) {
    return _sharedPreferenceService.containsKey(key: key);
  }

  Future<bool> clear() {
    return _sharedPreferenceService.clear();
  }
}
