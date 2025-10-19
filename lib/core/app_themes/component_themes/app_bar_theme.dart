import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class AppBarThemes {
  static AppBarTheme light() {
    return const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.gray800),
      titleTextStyle: TextStyle(
        color: AppColors.gray900,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    );
  }

  static AppBarTheme dark() {
    return const AppBarTheme(
      backgroundColor: AppColors.gray800,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.gray100),
      titleTextStyle: TextStyle(
        color: AppColors.gray100,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    );
  }
}
