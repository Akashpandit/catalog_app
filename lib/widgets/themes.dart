import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(color: Colors.deepPurple),
            textTheme: Theme.of(context).textTheme),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        cardColor: Colors.grey[600],
        canvasColor: Colors.black87,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
            color: Colors.black,
            iconTheme: IconThemeData(color: Colors.white),
            textTheme: Theme.of(context).textTheme),
      );

  //Colors
  static Color creamWhite = Color(0xfff5f5f5);
  static Color deepBlue = Color(0xff403b88);
}
