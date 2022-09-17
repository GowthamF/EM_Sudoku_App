import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  Future<bool> setBool({required String key, required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(key, value);
  }

  Future<bool> setDouble({required String key, required double value}) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setDouble(key, value);
  }

  Future<bool> setInt({required String key, required int value}) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setInt(key, value);
  }

  Future<bool> setString({required String key, required String value}) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  Future<bool> setStringList(
      {required String key, required List<String> value}) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList(key, value);
  }

  Future<bool?> getBool({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  Future<double?> getDouble({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  Future<int?> getInt({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<String?> getString({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<List<String>?> getStringList({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  Future<bool> containsKey({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  Future<bool> clear() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
