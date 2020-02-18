import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppConfig extends InheritedWidget {
  const AppConfig({
    @required this.appName,
    @required this.flavorName,
    @required this.apiUrl,
    @required Widget child,
  }) : super(child: child);

  final String appName;
  final String flavorName;
  final String apiUrl;

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
