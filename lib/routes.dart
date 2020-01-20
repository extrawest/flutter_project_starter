import 'package:flutter/material.dart';
import 'package:provider_starter_app/screens/home_screen.dart';

const String HOME_SCREEN_ROUTE = "/home";

var applicationRoutes = <String, WidgetBuilder>{
  HOME_SCREEN_ROUTE: (context) => HomeScreen(),
};
