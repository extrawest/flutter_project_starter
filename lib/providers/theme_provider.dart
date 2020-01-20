import 'package:flutter/material.dart';
import 'package:provider_starter_app/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool isLightTheme;

  ThemeProvider({this.isLightTheme = true});

  ThemeData get getThemeData =>
      isLightTheme ? ApplicationTheme.lightTheme : ApplicationTheme.darkTheme;

  set setThemeData(bool val) {
    if (val) {
      isLightTheme = true;
    } else {
      isLightTheme = false;
    }
    notifyListeners();
  }
}
