import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primary = Color(0xFFFF3C3C);
  static const background = Color(0xFFFFFFFF);

  static ThemeData theme(TextTheme textTheme) => ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(textTheme).copyWith(
          titleLarge: textTheme.headlineLarge?.copyWith(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: Colors.white,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: const StadiumBorder(),
            foregroundColor: AppTheme.primary,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
            side: const BorderSide(
              color: AppTheme.primary,
              width: 1.5,
            ),
          ),
        ),
      );
}
