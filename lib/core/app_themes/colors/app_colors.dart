import 'package:flutter/material.dart';

class AppColors {
  static const Color gray50 = Color(0xFFF9F9F9);
  static const Color gray100 = Color(0xFFF0F0F0);
  static const Color gray150 = Color(0xFFE5E5E5);
  static const Color gray200 = Color(0xFFD9D9D9);
  static const Color gray300 = Color(0xFFBFBFBF);
  static const Color gray400 = Color(0xFF999999);
  static const Color gray500 = Color(0xFF737373);
  static const Color gray600 = Color(0xFF525252);
  static const Color gray700 = Color(0xFF404040);
  static const Color gray800 = Color(0xFF262626);
  static const Color gray900 = Color(0xFF1C1C1C);

  static const Color primary = Color(0xFF54408C);
  static const Color whitePrimary = Color(0xFFEEEAFA);
  static const Color accent = Color(0xFF6A1B9A);

  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF03A9F4);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF7C4DFF), Color(0xFF6A1B9A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient grayGradient = LinearGradient(
    colors: [gray600, gray900],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color textLight = gray900;
  static const Color hintLight = gray500;

  static const Color textDark = gray50;
  static const Color hintDark = gray400;

  static const Color buttonDisabledLight = gray300;
  static const Color buttonDisabledDark = gray700;
  static const Color textDisabled = gray500;
}
