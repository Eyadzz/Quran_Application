import 'package:flutter/material.dart';
import 'package:quran_application/CustomBottomBar.dart';
class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  static const routeName = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
