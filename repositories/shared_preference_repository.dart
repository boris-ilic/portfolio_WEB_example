import 'package:boris_ilic_portfolio/constants/app_config.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/shared_prefs_keys.dart';

@singleton
// shared preferences as a local storage in browser
class SharedPreferencesRepository {
  SharedPreferencesRepository._privateConstructor();

  static final SharedPreferencesRepository _instance =
      SharedPreferencesRepository._privateConstructor();

  factory SharedPreferencesRepository() {
    return _instance;
  }

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String getString(String key, [String defaultValue = '']) {
    return _prefs.getString(key) ?? defaultValue;
  }

  Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }

  void changeCurrentLocale(Locale locale) {
    setString(SharedPrefsKeys.appLocale, locale.languageCode);
  }

  String getCurrentLocaleFromBrowser() =>
      getString(SharedPrefsKeys.appLocale, AppConfig.defaultLanguage);
}
