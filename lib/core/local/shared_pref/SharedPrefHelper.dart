import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  late final SharedPreferences _sharedPreferences;
  static SharedPrefHelper? _instance;

  SharedPrefHelper._(this._sharedPreferences);

  factory SharedPrefHelper() {
    print('INSTANCE CREATED $_instance');
    return _instance!;
  }

  static Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    print('"INITIALIZED"');
    _instance = SharedPrefHelper._(prefs);
  }

  SharedPreferences get instance => _sharedPreferences;

  Future<bool> setBool(String key, bool value) async {
    return _sharedPreferences.setBool(key, value);
  }

  bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  Future<bool> remove(String key) async {
    return _sharedPreferences.remove(key);
  }

  Future<bool> clear() async {
    return _sharedPreferences.clear();
  }
}