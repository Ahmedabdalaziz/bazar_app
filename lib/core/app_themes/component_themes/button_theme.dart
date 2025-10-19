import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';

class AppButtonTheme {
  static ElevatedButtonThemeData light() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.gray300;
          }
          return AppColors.primary;
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.gray500;
          }
          return AppColors.white;
        }),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        elevation: MaterialStateProperty.all(0),
      ),
    );
  }

  static ElevatedButtonThemeData dark() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.gray700;
          }
          return AppColors.primary;
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.gray500;
          }
          return AppColors.white;
        }),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
        elevation: MaterialStateProperty.all(0),
      ),
    );
  }

  static TextButtonThemeData lightTextButton() {
    return TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.gray400;
          }
          return AppColors.accent;
        }),
        overlayColor: MaterialStateProperty.all(
          AppColors.accent.withOpacity(0.1),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  static TextButtonThemeData darkTextButton() {
    return TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontWeight: FontWeight.bold),
        ),

        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.gray600;
          }
          return AppColors.accent;
        }),
        overlayColor: MaterialStateProperty.all(
          AppColors.accent.withOpacity(0.1),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData lightOutlinedButton() {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontWeight: FontWeight.bold),
        ),

        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.gray400;
          }
          return AppColors.accent;
        }),
        side: MaterialStateProperty.resolveWith<BorderSide>((states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(color: AppColors.gray300);
          }
          return BorderSide(color: AppColors.accent);
        }),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData darkOutlinedButton() {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontWeight: FontWeight.bold),
        ),

        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.gray600;
          }
          return AppColors.accent;
        }),
        side: MaterialStateProperty.resolveWith<BorderSide>((states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(color: AppColors.gray700);
          }
          return BorderSide(color: AppColors.accent);
        }),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}
