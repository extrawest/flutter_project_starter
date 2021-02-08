import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:provider_starter_app/app_config.dart';
import 'package:provider_starter_app/providers/home_provider.dart';
import 'package:provider_starter_app/providers/posts_provider.dart';
import 'package:provider_starter_app/providers/theme_provider.dart';
import 'package:provider_starter_app/routes.dart';

import 'services/api_service.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;
    final appConfig = AppConfig.of(context);
    final _apiService = ApiService(appConfig.apiUrl);

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => HomeProvider()),
          ChangeNotifierProvider(create: (context) => PostsProvider(_apiService)),
        ],
        child: Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Flutter Provider Starter',
            theme: themeProvider.getThemeData,
            initialRoute: splashScreenRoute,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              localizationDelegate
            ],
            supportedLocales: localizationDelegate.supportedLocales,
            locale: localizationDelegate.currentLocale,
            routes: applicationRoutes,
          );
        }),
      ),
    );
  }
}
