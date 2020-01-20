import 'package:flutter/material.dart';

class AppBarConfig {
  static AppBar defaultAppBar(BuildContext context, String titleText) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      centerTitle: true,
      title: Text(titleText),
      elevation: 3,
      iconTheme: Theme.of(context).iconTheme,
    );
  }
}
