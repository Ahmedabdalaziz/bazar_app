import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class AppInputTheme {
  static InputDecorationTheme light() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.gray400,
      hintStyle: const TextStyle(color: AppColors.gray600, fontSize: 14),
      labelStyle: const TextStyle(color: AppColors.gray700),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.gray300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
      ),
    );
  }

  static InputDecorationTheme dark() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.gray800,
      hintStyle: const TextStyle(color: AppColors.gray400, fontSize: 14),
      labelStyle: const TextStyle(color: AppColors.gray200),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.gray600),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
      ),
    );
  }
}
