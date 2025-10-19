import 'package:flutter/material.dart';

import 'app_dark_theme.dart';
import 'app_light_theme.dart';

sealed class AppThemes {
  static ThemeData dark() {
    return AppDarkTheme.data;
  }

  static ThemeData light() {
    return AppLightTheme.data;
  }
}
