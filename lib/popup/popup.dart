import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider_starter_app/popup/popup_content.dart';
import 'package:provider_starter_app/popup/popup_layout.dart';

class PopUp {
  static showDefault(BuildContext context, Widget widget, String title) {
    Navigator.push(
      context,
      PopupLayout(
        top: 30,
        left: 30,
        right: 30,
        bottom: 50,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
          child: PopupContent(
            content: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: AppBar(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                ),
                automaticallyImplyLeading: false,
                title: Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                ),
                actions: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.close,
                          color: Colors.grey,
                          size: 24.0,
                        ),
                      ))
                ],
                brightness: Theme.of(context).brightness,
              ),
              resizeToAvoidBottomPadding: false,
              body: widget,
            ),
          ),
        ),
      ),
    );
  }
}
