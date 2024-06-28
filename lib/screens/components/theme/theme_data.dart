import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThemes {
  static ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
    headlineMedium:
        GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 50),
    bodyLarge: GoogleFonts.nunitoSans(color: Colors.white, fontSize: 18),
    bodySmall: GoogleFonts.openSans(fontSize: 14, color: Colors.black),
  ));
}
