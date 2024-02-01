import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData myTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.blue.shade900,
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue.shade900,
      foregroundColor: Colors.white //here you can give the text color
      ),
  textTheme: TextTheme(
    displayLarge: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),

    //title
    titleLarge: GoogleFonts.montserrat(fontSize: 30),
    titleMedium: GoogleFonts.montserrat(fontSize: 16),
    titleSmall: GoogleFonts.montserrat(fontSize: 14),

    //body
    bodyLarge: GoogleFonts.montserrat(fontSize: 16),
    bodyMedium: GoogleFonts.montserrat(fontSize: 14),
    bodySmall: GoogleFonts.montserrat(fontSize: 12),
  ),
);
