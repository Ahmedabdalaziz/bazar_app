import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class BottomNavTheme {
  static BottomNavigationBarThemeData light() {
    return const BottomNavigationBarThemeData(
      backgroundColor: AppColors.gray100,
      selectedItemColor: AppColors.accent,
      unselectedItemColor: AppColors.gray500,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    );
  }

  static BottomNavigationBarThemeData dark() {
    return const BottomNavigationBarThemeData(
      backgroundColor: AppColors.gray800,
      selectedItemColor: AppColors.accent,
      unselectedItemColor: AppColors.gray500,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    );
  }
}
