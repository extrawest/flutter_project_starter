import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider_starter_app/app.dart';
import 'package:provider_starter_app/app_config.dart';
import 'package:provider_starter_app/localization/translate_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var configuredApp = AppConfig(
    appName: 'DEV Flutter Provider Application Starter',
    flavorName: 'dev',
    apiUrl: 'https://dev.example.com/api',
    child: Application(),
  );

  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en',
      preferences: TranslatePreferences(),
      supportedLocales: [
        'en',
        'uk',
      ]);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(LocalizedApp(delegate, configuredApp));
}
