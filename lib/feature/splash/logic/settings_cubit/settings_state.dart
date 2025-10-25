part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class SettingsLoaded extends SettingsState {
  final ThemeMode themeMode;
  final Locale locale;

  SettingsLoaded({
    required this.themeMode,
    required this.locale,
  });

  SettingsLoaded copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return SettingsLoaded(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}

final class SettingsFailure extends SettingsState {
  final String error;
  SettingsFailure(this.error);
}
