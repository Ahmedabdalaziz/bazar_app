import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import '../component_themes/app_bar_theme.dart';
import '../component_themes/bottom_nav_theme.dart';
import '../component_themes/button_theme.dart';
import '../component_themes/color_schemes.dart';
import '../component_themes/input_theme.dart';
import '../text_style/text_style_dark_mode.dart';

class AppDarkTheme {
  static ThemeData get data {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.gray900,
      fontFamily: 'Poppins',
      colorScheme: AppColorSchemes.dark(),
      appBarTheme: AppBarThemes.dark(),
      textTheme: AppTextStyleDarkMode.darkTextTheme,
      elevatedButtonTheme: AppButtonTheme.dark(),
      textButtonTheme: AppButtonTheme.darkTextButton(),
      outlinedButtonTheme: AppButtonTheme.darkOutlinedButton(),
      inputDecorationTheme: AppInputTheme.dark(),
      bottomNavigationBarTheme: BottomNavTheme.dark(),
      dividerColor: AppColors.gray700,
      cardColor: AppColors.gray800,
    );
  }
}
