import 'package:flutter/material.dart';
import 'package:provider_starter_app/theme/theme.dart';

//todo: add auto read from cache
//todo: add resolution aware images
class ThemeProvider extends ChangeNotifier {
  bool isLightTheme;

  ThemeProvider({this.isLightTheme = true});

  ThemeData get getThemeData =>
      isLightTheme ? lightTheme : darkTheme;

  set setThemeData(bool val) {
    if (val) {
      isLightTheme = true;
    } else {
      isLightTheme = false;
    }
    notifyListeners();
  }
}
