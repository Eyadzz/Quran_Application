import 'package:flutter/material.dart';
import 'package:quran_application/CustomBottomBar.dart';
import 'package:quran_application/QuranScreen.dart';
import 'package:quran_application/RadioSceen.dart';
import 'package:quran_application/TasbeehScreen.dart';
import 'package:quran_application/HadethScreen.dart';
import 'package:provider/provider.dart';
import 'AppConfigProvider.dart';
import 'SideMenu.dart';
class Home extends StatefulWidget {
  static const routeName = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late AppConfigProvider provider;
  PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      drawer: SideMenu(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("إسلامي", style: TextStyle(
          color: provider.isDarkTheme()?Colors.white:Colors.black,
          fontSize: 30,
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
          RadioScreen(),
          TasbeehScreen(),
          HadethScreen(),

        ],
      ),
      bottomNavigationBar: CustomBottomBar(mypage: _myPage),
    );
  }
}

