import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider_starter_app/app.dart';
import 'package:provider_starter_app/app_config.dart';
import 'package:provider_starter_app/localization/translate_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final configuredApp = AppConfig(
    appName: 'DEV Flutter Provider Application Starter',
    flavorName: 'dev',
    apiUrl: 'jsonplaceholder.typicode.com',
    child: Application(),
  );

  final delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en',
      preferences: TranslatePreferences(),
      supportedLocales: [
        'en',
        'uk',
      ]);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(LocalizedApp(delegate, configuredApp));
}
