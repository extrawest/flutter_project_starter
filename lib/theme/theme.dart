import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color redLight = Color(0xFFE44125);
const Color blackShade = Color(0xFF222222);
const Color cherryRed = Color(0xffe8001d);
const Color greyShadeLight = Color(0xFFE5E5E5);
const Color greyLight = Color(0x0c000000);

class TextStyles {
  static const notifierTextLabel = TextStyle(
    fontSize: 26,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
  );
}

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: blackShade,
  accentColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.white),
  dividerColor: Colors.black12,
  fontFamily: GoogleFonts.roboto().fontFamily,
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0), // or use string of the font in the assets 'SFUIDisplay'
  ),
);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: greyShadeLight,
  accentColor: Colors.black,
  floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.black),
  dividerColor: Colors.white54,
  fontFamily: GoogleFonts.roboto().fontFamily,
  // or use string of the font in the assets 'SFUIDisplay'
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0), // or use string of the font in the assets 'SFUIDisplay'
  ),
);
