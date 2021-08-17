import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppConfigProvider.dart';
import 'Home.dart';


class SplashCustom extends StatefulWidget {
  static const routeName = "splash";
  @override
  _SplashCustomState createState() => _SplashCustomState();
}

class _SplashCustomState extends State<SplashCustom> {
  late AppConfigProvider provider;

  @override
  void initState(){
    super.initState();
    _navigateToHome();
  }
  _navigateToHome() async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, Home.routeName);
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: provider.isDarkTheme()? AssetImage("assets/images/splashbgdark.png"):AssetImage("assets/images/bg3.png"),
          fit: BoxFit.cover
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          provider.isDarkTheme()? Image.asset("assets/images/logo.png"):Image.asset("assets/images/logo2.png"),
          Expanded(child: Container()),
          provider.isDarkTheme()? Image.asset("assets/images/route yellow.png"):Image.asset("assets/images/Group 7.png"),
        ],
      )
    );
  }
}
