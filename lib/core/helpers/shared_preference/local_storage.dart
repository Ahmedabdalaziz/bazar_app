import 'package:bazar_app/core/helpers/shared_preference/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _preferences;

  static final LocalStorage _instance = LocalStorage._internal();

  factory LocalStorage() => _instance;

  LocalStorage._internal();

  static Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  String? getData(String key) => _preferences?.getString(key);

  Future<void> setData(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  bool? getBool(String key) => _preferences?.getBool(key);

  Future<void> setBool(String key, bool value) async {
    await _preferences?.setBool(key, value);
  }

  Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }

  Future<void> clearAll() async {
    await _preferences?.clear();
  }
}

class ThemeStorage {
  static const String _key = PrefKeys.currentTheme;

  static final ThemeStorage _instance = ThemeStorage._internal();

  factory ThemeStorage() => _instance;

  ThemeStorage._internal();

  Future<void> saveTheme(String theme) async {
    await LocalStorage().setData(_key, theme);
  }

  String? getTheme() {
    return LocalStorage().getData(_key);
  }

  Future<void> clearTheme() async {
    await LocalStorage().remove(_key);
  }
}

class LanguageStorage {
  static const String _key = PrefKeys.currentLanguage;

  static final LanguageStorage _instance = LanguageStorage._internal();

  factory LanguageStorage() => _instance;

  LanguageStorage._internal();

  Future<void> saveLanguage(String lang) async {
    await LocalStorage().setData(_key, lang);
  }

  String? getLanguage() {
    return LocalStorage().getData(_key);
  }

  Future<void> clearLanguage() async {
    await LocalStorage().remove(_key);
  }
}

class OnboardingStorage {
  static const String _key = PrefKeys.onboardingCompleted;

  static final OnboardingStorage _instance = OnboardingStorage._internal();

  factory OnboardingStorage() => _instance;

  OnboardingStorage._internal();

  Future<void> saveSeen(bool seen) async {
    await LocalStorage().setBool(_key, seen);
  }

  bool? isSeen() {
    return LocalStorage().getBool(_key);
  }

  Future<void> clearSeen() async {
    await LocalStorage().remove(_key);
  }
}
