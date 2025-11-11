import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppColorSchemes {
  static ColorScheme light() {
    return const ColorScheme.light(
      primary: AppColors.primary,
      primaryFixed: AppColors.accent,
      secondary: AppColors.gray400,
      surface: AppColors.white,
      background: AppColors.gray300,
      error: AppColors.error,
      onPrimary: AppColors.white,
      onSecondary: AppColors.gray700,
      onSurface: AppColors.gray900,
      onSecondaryContainer: AppColors.gray500,
      onError: AppColors.white,
      outline: AppColors.whitePrimary,
    );
  }

  static ColorScheme dark() {
    return const ColorScheme.dark(
      primary: AppColors.primary,
      primaryFixed: AppColors.accent,
      secondary: AppColors.gray500,
      surface: AppColors.gray800,
      background: AppColors.gray900,
      error: AppColors.error,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.gray100,
      onError: AppColors.white,
    );
  }
}
