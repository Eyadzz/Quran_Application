import 'package:flutter/material.dart';
import 'package:quran_application/QuranScreen.dart';

import 'SplashCustom.dart';
import 'Home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quran",
      home: SplashCustom(),
      routes: {
        QuranScreen.routeName:(context)=>QuranScreen(),
        Home.routeName: (context)=>Home(),
        SplashCustom.routeName: (context)=>SplashCustom()
      },
    );
  }
}


