import 'package:flutter/material.dart';
import 'package:quran_application/Home.dart';
import 'package:quran_application/Splash.dart';
import 'package:quran_application/SplashCustom.dart';
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
        Home.routeName: (context)=>Home(),
        SplashCustom.routeName: (context)=>SplashCustom()
      },
    );
  }
}


