import 'package:flutter/material.dart';
import 'package:provider_starter_app/screens/home_screen.dart';

const String homeScreenRoute = "/home";

Map<String, WidgetBuilder> applicationRoutes = <String, WidgetBuilder>{
  homeScreenRoute: (context) => const HomeScreen(),
};
