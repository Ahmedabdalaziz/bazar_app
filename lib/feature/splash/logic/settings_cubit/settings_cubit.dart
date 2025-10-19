import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
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

    // theme
    if (savedTheme == 'dark') {
      _themeMode = ThemeMode.dark;
    } else if (savedTheme == 'light') {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.system;
    }

    emit(SettingsThemeSuccess(_themeMode));

    // language
    if (savedLang != null) {
      _locale = Locale(savedLang);
      emit(SettingsLanguageSuccess(_locale));
    }
  }

  Future<void> toggleTheme() async {
    emit(SettingsThemeLoading());
    try {
      if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
        await ThemeStorage().saveTheme('dark');
      } else {
        _themeMode = ThemeMode.light;
        await ThemeStorage().saveTheme('light');
      }
      emit(SettingsThemeSuccess(_themeMode));
    } catch (e) {
      emit(SettingsThemeFailure(e.toString()));
    }
  }

  Future<void> changeLanguage(String langCode) async {
    emit(SettingsLanguageLoading());
    try {
      _locale = Locale(langCode);
      await LanguageStorage().saveLanguage(langCode);
      emit(SettingsLanguageSuccess(_locale));
    } catch (e) {
      emit(SettingsLanguageFailure(e.toString()));
    }
  }
}
