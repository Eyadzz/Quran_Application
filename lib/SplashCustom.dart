import 'package:flutter/material.dart';
import 'package:quran_application/QuranScreen.dart';

class SplashCustom extends StatefulWidget {
  static const routeName = "splash";
  @override
  _SplashCustomState createState() => _SplashCustomState();
}

class _SplashCustomState extends State<SplashCustom> {

  @override
  void initState(){
    super.initState();
    _navigateToHome();
  }
  _navigateToHome() async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, QuranScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg3.png"),
          fit: BoxFit.cover
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Image.asset("assets/images/logo.png"),
          Expanded(child: Container()),
          Image.asset("assets/images/Group 7.png")
        ],
      )
    );
  }
}
