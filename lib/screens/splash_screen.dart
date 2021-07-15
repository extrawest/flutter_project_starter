import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider_starter_app/routes.dart';
import 'package:provider_starter_app/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) async {
      Future.delayed(
        Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, homeScreenRoute),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: greyShadeLight,
          child: Text('Splash Screen'),
        ),
      ),
    );
  }
}
