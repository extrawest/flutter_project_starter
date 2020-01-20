import 'package:flutter/material.dart';

const Color redLight = const Color(0xFFE44125);
const Color blackShade = const Color(0xFF222222);

class TextStyles {
  static const notifierTextLabel = const TextStyle(
    fontSize: 26,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
  );
}

class ApplicationTheme {
  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    fontFamily: 'SFUIDisplay',
  );

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    fontFamily: 'SFUIDisplay',
  );
}
