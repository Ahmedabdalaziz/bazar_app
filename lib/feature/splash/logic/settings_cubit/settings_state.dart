part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

// theme
final class SettingsThemeLoading extends SettingsState {}
final class SettingsThemeSuccess extends SettingsState {
  final ThemeMode themeMode;
  SettingsThemeSuccess(this.themeMode);
}
final class SettingsThemeFailure extends SettingsState {
  final String error;
  SettingsThemeFailure(this.error);
}

// language
final class SettingsLanguageLoading extends SettingsState {}
final class SettingsLanguageSuccess extends SettingsState {
  final Locale locale;
  SettingsLanguageSuccess(this.locale);
}
final class SettingsLanguageFailure extends SettingsState {
  final String error;
  SettingsLanguageFailure(this.error);
}
