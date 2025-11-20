import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';

class AppButtonTheme {
  static ElevatedButtonThemeData light() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.buttonDisabledLight;
          }
          return AppColors.primary;
        }),
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 48.h)),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.textDisabled;
          }
          return AppColors.white;
        }),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(48.r)),
        ),
        elevation: MaterialStateProperty.all(0),
      ),
    );
  }

  static ElevatedButtonThemeData dark() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.buttonDisabledDark;
          }
          return AppColors.primary;
        }),
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 48.h)),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.textDisabled;
          }
          return AppColors.white;
        }),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
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
          TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.hintDark;
          }
          return AppColors.accent;
        }),
        overlayColor: MaterialStateProperty.all(
          AppColors.accent.withOpacity(0.1),
        ),
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 48.h)),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
      ),
    );
  }

  static TextButtonThemeData darkTextButton() {
    return TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.hintLight;
          }
          return AppColors.accent;
        }),
        overlayColor: MaterialStateProperty.all(
          AppColors.accent.withOpacity(0.1),
        ),
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 48.h)),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData lightOutlinedButton() {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.hintDark;
          }
          return AppColors.accent;
        }),
        side: MaterialStateProperty.resolveWith<BorderSide>((states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(color: AppColors.buttonDisabledLight, width: 1.w);
          }
          return BorderSide(color: AppColors.accent, width: 1.w);
        }),
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 48.h)),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData darkOutlinedButton() {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.hintLight;
          }
          return AppColors.accent;
        }),
        side: MaterialStateProperty.resolveWith<BorderSide>((states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(color: AppColors.buttonDisabledDark, width: 1.w);
          }
          return BorderSide(color: AppColors.accent, width: 1.w);
        }),
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 48.h)),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
        ),
      ),
    );
  }
}
