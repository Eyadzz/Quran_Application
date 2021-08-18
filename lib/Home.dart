import 'package:flutter/material.dart';
import 'package:quran_application/modules/CustomBottomBar.dart';
import 'package:quran_application/tabs/Quran/QuranScreen.dart';
import 'package:quran_application/modules/SideMenu.dart';
import 'package:quran_application/tabs/Tasbeeh/TasbeehScreen.dart';
import 'package:quran_application/tabs/Hadeth/HadethScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'utility/AppConfigProvider.dart';
import 'modules/SideMenu.dart';
import 'package:quran_application/tabs/Radio/RadioSceen.dart';

class Home extends StatefulWidget {
  static const routeName = 'home';
  @override
  _HomeState createState() => _HomeState();
}
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeState extends State<Home> {
  late AppConfigProvider provider;
  PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      key: scaffoldKey,
      drawer: SideMenu(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: new Container(),
        title: Text(AppLocalizations.of(context)!.title, style: TextStyle(
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

