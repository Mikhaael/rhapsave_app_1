import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  const AppColors._();

  static const primary = Color(0xFFF64F00);
  static final primaryVariant = primary.withAlpha(25);
  static const background = Color(0xFFF9F9F9);
  static const text = Color(0xFF26202C);
}

ThemeData get theme {
  final theme = ThemeData.light();
  return ThemeData(
    colorScheme: theme.colorScheme.copyWith(
      primary: AppColors.primary,
      primaryContainer: AppColors.primaryVariant,
      background: AppColors.background,
      surface: AppColors.background,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      theme.textTheme.apply(
        bodyColor: AppColors.text,
        displayColor: AppColors.text,
      ),
    ),
  );
}
