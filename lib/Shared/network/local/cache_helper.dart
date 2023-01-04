import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _sharedPreferences;
  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> PutData(
    String key,
    dynamic value,
  ) async {

    if(value is int) return await _sharedPreferences.setInt(key, value);
    if(value is String) return await _sharedPreferences.setString(key, value);
    if(value is double) return await _sharedPreferences.setDouble(key, value);
    return await _sharedPreferences.setBool(key, value);
  }

  static getData(String key) {

    return _sharedPreferences.get(key);
  }

  static Future<bool> removeData(
      String key,

      ) async {
    return await _sharedPreferences.remove(key);


  }
}
