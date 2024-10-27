import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
@lazySingleton
class SharedPreferencesFactory {
  /// Removes a value from SharedPreferences with given [key].
  Future<bool> removeData(String key) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  Future<bool> clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  Future<bool?> setData(String key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value.runtimeType) {
      case const (String):
        return await sharedPreferences.setString(key, value);
      case const (int):
        return await sharedPreferences.setInt(key, value);
      case const (bool):
        return await sharedPreferences.setBool(key, value);
      case const (double):
        return await sharedPreferences.setDouble(key, value);
      default:
        return null;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  Future<bool> getBool(String key) async {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  Future<double> getDouble(String key) async {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  Future<int> getInt(String key) async {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  Future<String> getString(String key) async {
    debugPrint('SharedPrefHelper : getString with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  Future<void> setSecuredString(String key, String value) async {
    const FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    debugPrint("FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    return await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  Future<String> getSecuredString(String key) async {
    const FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage : getSecuredString with key :$key');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Deletes an String value from FlutterSecureStorage with given [key].
  Future<void> deleteSecuredString(String key) async {
    const FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage : deleteSecuredString with key :$key');
    return await flutterSecureStorage.delete(key: key);
  }

  /// Removes all keys and values in the FlutterSecureStorage
  Future<void> clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    const FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    return await flutterSecureStorage.deleteAll();
  }
}