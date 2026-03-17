import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryPurple = Color(0xFF6A1B9A);
  static const Color secondaryPurple = Color(0xFF9C27B0);
  static const Color accentPurple = Color(0xFFE1BEE7);
  static const Color backgroundLight = Color(0xFFF3E5F5);
  
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryPurple,
        primary: primaryPurple,
        secondary: secondaryPurple,
        surface: Colors.white,
        background: backgroundLight,
      ),
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold, color: primaryPurple),
        titleLarge: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
        bodyMedium: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: primaryPurple,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPurple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),
    );
  }
}
