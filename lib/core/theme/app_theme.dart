import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.background,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.background,
      foregroundColor: AppColor.text,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: AppColor.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    ),
    textTheme: GoogleFonts.interTextTheme().apply(
      bodyColor: AppColor.text,
      displayColor: AppColor.text,
    ),
  );
}
