import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 29, 41, 55),
    sliderTheme: const SliderThemeData(
      overlayColor: Color.fromARGB(255, 67, 94, 125),
      thumbColor: Color.fromARGB(255, 122, 152, 186),
      inactiveTrackColor: Color.fromARGB(255, 85, 90, 96),
      activeTickMarkColor: Color.fromARGB(255, 33, 80, 134),
      activeTrackColor: Color.fromARGB(255, 45, 63, 85),
      valueIndicatorColor: Color.fromARGB(255, 45, 63, 85),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 45, 63, 85),
    ),
    dividerColor: Colors.white60,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 43, 64, 88),
    ),
    iconTheme: IconThemeData(
      color: Colors.grey.shade400,
      size: 20,
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.roboto(
        color: Colors.grey.shade400,
        fontSize: 14,
      ),
      bodyMedium: GoogleFonts.roboto(
        color: Colors.grey.shade400,
        fontSize: 16,
      ),
      bodyLarge: GoogleFonts.roboto(
        color: Colors.grey.shade400,
        fontSize: 18,
      ),
      titleMedium: GoogleFonts.roboto(
        color: Colors.grey.shade400,
        fontSize: 22,
      ),
      titleLarge: GoogleFonts.roboto(
        color: Colors.grey.shade400,
        fontSize: 24,
      ),
    ),
  );
}
