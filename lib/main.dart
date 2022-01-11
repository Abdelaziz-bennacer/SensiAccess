import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sensi_access/views/good_form.dart';
import 'package:sensi_access/views/page_couleurs.dart';
import 'package:sensi_access/views/page_nav_auditive.dart';
import 'views/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeData(
          primaryColor: Colors.red,
          colorScheme: ColorScheme.fromSwatch(accentColor: Colors.red),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.red,
            titleTextStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        dark: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.black,
          colorScheme: ColorScheme.fromSwatch(accentColor: Colors.black),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            titleTextStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) {
          return MaterialApp(
            //localizationsDelegates: const [GlobalWidgetsLocalizations.delegate],
            //supportedLocales: const [Locale('en'), Locale('fr')],
            debugShowCheckedModeBanner: false,
            theme: theme,
            darkTheme: darkTheme,
            home: const MyHomePage(),
            routes: {
              MyHomePage.routeName: (context) => const MyHomePage(),
              PageNavigationAuditive.routeName: (context) =>
                  const PageNavigationAuditive(),
              GoodForm.routeName: (context) => const GoodForm(),
              PageCouleurs.routeName: (context) => const PageCouleurs(),
            },
          );
        });
  }
}
