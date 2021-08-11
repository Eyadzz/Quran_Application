import 'package:flutter/material.dart';
import 'package:quran_application/CustomBottomBar.dart';
import 'package:quran_application/QuranScreen.dart';
import 'package:quran_application/TasbeehScreen.dart';
import 'package:quran_application/HadethScreen.dart';
class Home extends StatefulWidget {
  static const routeName = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("إسلامي", style: TextStyle(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.bold,
          fontFamily: "ElMessiri",
        ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body:PageView(
        controller: _myPage,
        onPageChanged: (int){},
        children: [
            QuranScreen(),
            Container(
              child: Center(child: Text("Radio"),),
            ),
            TasbeehScreen(),
            HadethScreen(),

        ],
    ),
      bottomNavigationBar: CustomBottomBar(mypage: _myPage),
    );
  }
}

