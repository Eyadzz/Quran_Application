import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_application/AppConfigProvider.dart';
import 'package:quran_application/QuranScreen.dart';
import 'package:quran_application/TasbeehScreen.dart';
import 'package:quran_application/HadethScreen.dart';
import 'OptionalThemeData.dart';
import 'SplashCustom.dart';
import 'Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (buildContext) => AppConfigProvider(),
      builder: (buildContext, widget) {
        final provider = Provider.of<AppConfigProvider>(buildContext);
        return MaterialApp(
          themeMode: provider.themeMode,
          darkTheme: OptionalThemeData.darkTheme,
          theme: OptionalThemeData.lightTheme,
          title: "Quran",
          debugShowCheckedModeBanner: false,
          home: SplashCustom(),
          routes: {
            Home.routeName: (context) => Home(),
            QuranScreen.routeName: (context) => QuranScreen(),
            SplashCustom.routeName: (context) => SplashCustom(),
            TasbeehScreen.routeName: (context) => TasbeehScreen(),
            HadethScreen.routeName: (context) => HadethScreen(),
          },
        );
      },
    );
  }
}
