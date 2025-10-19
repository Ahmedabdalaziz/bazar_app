import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

class AppTextStyleDarkMode{
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.gabarito(
      fontWeight: FontWeight.bold,
      color: AppColors.textDark,
    ),
    displayMedium: GoogleFonts.gabarito(
      fontWeight: FontWeight.bold,
      color: AppColors.textDark,
    ),
    displaySmall: GoogleFonts.gabarito(
      fontWeight: FontWeight.bold,
      color: AppColors.textDark,
    ),
    headlineMedium: GoogleFonts.gabarito(
      fontWeight: FontWeight.w600,
      color: AppColors.textDark,
    ),
    headlineSmall: GoogleFonts.gabarito(
      fontWeight: FontWeight.w600,
      color: AppColors.textDark,
    ),
    titleLarge: GoogleFonts.gabarito(
      fontWeight: FontWeight.w600,
      color: AppColors.textDark,
    ),
    titleMedium: GoogleFonts.gabarito(
      fontWeight: FontWeight.w500,
      color: AppColors.textDark,
    ),
    titleSmall: GoogleFonts.gabarito(
      fontWeight: FontWeight.w500,
      color: AppColors.textDark,
    ),
    bodyLarge: GoogleFonts.gabarito(
      fontWeight: FontWeight.w500,
      color: AppColors.textDark,
    ),
    bodyMedium: GoogleFonts.gabarito(
      color: AppColors.textDark,
    ),
    bodySmall: GoogleFonts.gabarito(
      color: AppColors.textDark,
    ),
    labelLarge: GoogleFonts.gabarito(
      fontWeight: FontWeight.w400,
      color: AppColors.hintDark,
    ),
    labelMedium: GoogleFonts.gabarito(
      color: AppColors.hintDark,
    ),
    labelSmall: GoogleFonts.gabarito(
      color: AppColors.hintDark,
    ),
  );

}