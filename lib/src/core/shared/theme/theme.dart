import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final pokedexTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0XFFDC0A2D),
    secondary: const Color(0XFF2F3E77),
    tertiary: const Color(0XFFE0E0E0),
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 24,
    ),
    displayMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 20,
    ),
    bodySmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontSize: 12,
    ),
    bodyMedium: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 14,
    ),
    bodyLarge: GoogleFonts.nunito(
      fontWeight: FontWeight.w700,
      color: const Color(0XFFFFFFFF),
      fontSize: 18,
    ),
  ),
);
