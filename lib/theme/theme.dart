import 'package:flutter/material.dart';

const Color redLight = Color(0xFFE44125);
const Color blackShade = Color(0xFF222222);
const Color cherryRed = Color(0xffe8001d);
const Color greyShadeLight = Color(0xFFE5E5E5);

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
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
  fontFamily: 'SFUIDisplay',
);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: greyShadeLight,
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  fontFamily: 'SFUIDisplay',
);
