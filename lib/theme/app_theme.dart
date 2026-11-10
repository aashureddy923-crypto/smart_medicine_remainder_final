// Experiment 6: Applying Themes and Custom Styles Using ThemeData
import 'package:flutter/material.dart';

class AppTheme {
  static const Color medicalTeal = Color(0xFF00796B);
  static const Color accentCyan = Color(0xFF00ACC1);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: medicalTeal,
        primary: medicalTeal,
        secondary: accentCyan,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: const Color(0xFFF7FAF9),
      appBarTheme: const AppBarTheme(
        backgroundColor: medicalTeal,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: medicalTeal,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: medicalTeal,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
