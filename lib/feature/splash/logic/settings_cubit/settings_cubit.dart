import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/shared_preference/local_storage.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = const Locale('en');

  ThemeMode get themeMode => _themeMode;

  Locale get locale => _locale;

  Future<void> initSettings() async {
    await LocalStorage.init();

    final savedTheme = ThemeStorage().getTheme();
    final savedLang = LanguageStorage().getLanguage();

    // ضبط الثيم
    switch (savedTheme) {
      case 'dark':
        _themeMode = ThemeMode.dark;
        break;
      case 'light':
        _themeMode = ThemeMode.light;
        break;
      default:
        _themeMode = ThemeMode.system;
    }

    // ضبط اللغة
    _locale = Locale(savedLang ?? 'en');

    emit(SettingsLoaded(themeMode: _themeMode, locale: _locale));
  }

  Future<void> toggleTheme() async {
    if (state is! SettingsLoaded) return;

    final current = state as SettingsLoaded;
    ThemeMode newMode;

    if (_themeMode == ThemeMode.light) {
      newMode = ThemeMode.dark;
      await ThemeStorage().saveTheme('dark');
    } else {
      newMode = ThemeMode.light;
      await ThemeStorage().saveTheme('light');
    }

    _themeMode = newMode;
    emit(current.copyWith(themeMode: newMode));
  }

  Future<void> toggleLanguage() async {
    if (state is! SettingsLoaded) return;

    final current = state as SettingsLoaded;
    Locale newLocale;

    if (_locale.languageCode == 'en') {
      newLocale = const Locale('ar');
      await LanguageStorage().saveLanguage('ar');
    } else {
      newLocale = const Locale('en');
      await LanguageStorage().saveLanguage('en');
    }

    _locale = newLocale;
    emit(current.copyWith(locale: newLocale));
  }

  Future<void> resetSettings() async {
    try {
      await ThemeStorage().clearTheme();
      await LanguageStorage().clearLanguage();
      _themeMode = ThemeMode.system;
      _locale = const Locale('en');
      emit(SettingsLoaded(themeMode: _themeMode, locale: _locale));
    } catch (e) {
      emit(SettingsFailure('Failed to reset settings: $e'));
    }
  }

  bool get isArabic => _locale.languageCode == 'ar';

  bool get isDarkMode => _themeMode == ThemeMode.dark;
}
