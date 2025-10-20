import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';

class AppInputTheme {
  static InputDecorationTheme light() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.gray100,
      hintStyle: TextStyle(color: AppColors.gray200, fontSize: 14.sp),
      labelStyle: const TextStyle(color: AppColors.gray700),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.sp),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.sp),
        borderSide: BorderSide.none,
      ),
    );
  }

  static InputDecorationTheme dark() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.gray800,
      hintStyle: TextStyle(color: AppColors.gray200, fontSize: 14.sp),
      labelStyle: const TextStyle(color: AppColors.gray200),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.sp),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.sp),
        borderSide: BorderSide.none,
      ),
    );
  }
}
