import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../component_themes/app_bar_theme.dart';
import '../component_themes/bottom_nav_theme.dart';
import '../component_themes/button_theme.dart';
import '../component_themes/color_schemes.dart';
import '../component_themes/input_theme.dart';
import '../text_style/text_style_light_mode.dart';

class AppLightTheme {
  static ThemeData get data {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.gray50,
      fontFamily: 'Poppins',
      colorScheme: AppColorSchemes.light(),
      appBarTheme: AppBarThemes.light(),
      textTheme: AppTextStyleLightMode.lightTextTheme,
      elevatedButtonTheme: AppButtonTheme.light(),
      textButtonTheme: AppButtonTheme.lightTextButton(),
      outlinedButtonTheme: AppButtonTheme.lightOutlinedButton(),
      inputDecorationTheme: AppInputTheme.light(),
      bottomNavigationBarTheme: BottomNavTheme.light(),
      dividerColor: AppColors.gray300,
      cardColor: AppColors.white,
    );
  }
}
