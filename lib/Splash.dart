import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Home.dart';



class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);


  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 2,
        navigateAfterSeconds: new Home(),
        image: new Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.white,
        photoSize: 100.0,
        loaderColor: Colors.yellow
    );
  }
}




