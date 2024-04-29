import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  AppSharedPreference._internal();

  static final AppSharedPreference instance = AppSharedPreference._internal();

  late final SharedPreferences preferences;

  Future<void> initSharedPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> setValue(String key, dynamic value) async {
    try {
      if (value is String) {
        await preferences.setString(key, value);
      } else if (value is int) {
        await preferences.setInt(key, value);
      } else if (value is bool) {
        await preferences.setBool(key, value);
      } else if (value is List<String>) {
        await preferences.setStringList(key, value);
      } else {
        Exception('Type ${value.runtimeType} is undefined');
      }
    } catch (_) {
      throw Exception('Failed to save $key: ${value.toString()}');
    }
  }

  Object? getValue(String key) {
    return preferences.get(key);
  }

  Future<void> setStringList(String key, List<String> value) {
    return preferences.setStringList(key, value);
  }

  String? getString(String key) {
    return preferences.getString(key);
  }

  List<String>? getStringList(String key) {
    return preferences.getStringList(key);
  }

  Future<void> remove(String key) async {
    await preferences.remove(key);
  }

  Future<void> clear() async {
    await preferences.clear();
  }
}
