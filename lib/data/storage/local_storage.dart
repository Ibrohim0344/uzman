import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domains/entities/user/user_local_info.dart';
import 'keys/storage_keys.dart';

class LocalStorage {
  LocalStorage._();

  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> identifyUser() async {
    await _preferences?.setBool(StorageKeys.isAuthenticated, true);
  }

  static bool getUserStatus() {
    return _preferences?.getBool(StorageKeys.isAuthenticated) ?? false;
  }

  static Future<void> saveUser(UserLocalInfo user) async {
    await _preferences?.setString(
      StorageKeys.user,
      jsonEncode(user.toJson()),
    );
  }

  static UserLocalInfo getUser() => UserLocalInfo.fromJson(jsonDecode(
      (_preferences?.getString(StorageKeys.user)) ??
          jsonEncode(UserLocalInfo())));

  static Future<void> deleteUser() async => await _preferences?.clear();

  static Future<void> saveToken(String token) async {
    await _preferences?.setString(StorageKeys.token, token);
  }

  static String? getToken() => _preferences?.getString(StorageKeys.token);

  static Future<void> saveLang(String lang) async {
    await _preferences?.setString(StorageKeys.language, lang);
  }

  static String getLang() =>
      _preferences?.getString(StorageKeys.language) ?? "uz";

  static Future<void> saveTheme(bool isDarkMode) async {
    await _preferences?.setBool(StorageKeys.isDarkMode, isDarkMode);
  }

  static Future<void> getTheme() async =>
      _preferences?.getBool(StorageKeys.isDarkMode);
}
