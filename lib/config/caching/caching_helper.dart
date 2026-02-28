import 'package:shared_preferences/shared_preferences.dart';

class CachingHelper {
  //Singleton Pattern
  static late SharedPreferences _sharedPreferences;
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> remove(String key) async {
    await _sharedPreferences.remove(key);
  }

  static Future<void> setBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }

  static String getString(String key) {
    return _sharedPreferences.getString(key) ?? "";
  }

  static Future<void> setString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  static bool getBool(String key) {
    return _sharedPreferences.getBool(key) ?? false;
  }

  static Future<void> setStringList(String key, List<String> value) async {
    await _sharedPreferences.setStringList(key, value);
  }

  static List<String> getStringList(String key) {
    return _sharedPreferences.getStringList(key) ?? [];
  }
}
