import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.raleway().fontFamily,
      primaryTextTheme: GoogleFonts.ralewayTextTheme(),
      appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600)));

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(primarySwatch: Colors.orange);
}
