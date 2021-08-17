import 'package:flutter/material.dart';
import 'package:quran_application/QuranScreen.dart';
import 'package:quran_application/TasbeehScreen.dart';
import 'package:quran_application/RadioSceen.dart';
import 'package:provider/provider.dart';
import 'AppConfigProvider.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar ({Key? key, this.mypage}) : super(key: key);
  static const routeName = "home";
  final iconSize = 30.0;

  final quranPageName = QuranScreen.routeName;
  final hasdisPageName = QuranScreen.routeName;
  final sebhaPageName = TasbeehScreen.routeName;
  final radioPageName = RadioScreen.routeName;

  final mypage;
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  late AppConfigProvider provider;
  var mainColor = Colors.white, activeColor = Colors.black;
  var currentIndex = 0;

  changeColor(index, currentIndex){
    if(index == currentIndex){
      return provider.isDarkTheme()? Color.fromRGBO(252,196,64,1):activeColor;
    }else{
      return mainColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: (){
                  //Navigator.pushReplacementNamed(context, widget.quranPageName);
                  widget.mypage.jumpToPage(0);
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: ImageIcon(
                  AssetImage("assets/images/moshaf_blue@3x.png"),
                  color: changeColor(0, currentIndex),
                  size: widget.iconSize,
                ),
              ),
              IconButton(
                onPressed: (){
                  //Navigator.pushReplacementNamed(context, widget.radioPageName);
                  widget.mypage.jumpToPage(1);
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: ImageIcon(
                  AssetImage("assets/images/radio_blue.png"),
                  color: changeColor(1, currentIndex),
                  size: widget.iconSize,
                ),
              ),
              IconButton(
                onPressed: (){
                  //Navigator.pushReplacementNamed(context, widget.sebhaPageName);
                  widget.mypage.jumpToPage(2);
                  setState(() {
                    currentIndex = 2;
                  });
                },
                icon: ImageIcon(
                  AssetImage("assets/images/sebha_blue.png"),
                  //color: widget.iconColor,
                  color: changeColor(2, currentIndex),
                  size: widget.iconSize,
                ),
              ),
              IconButton(
                onPressed: (){
                  //Navigator.pushReplacementNamed(context, widget.hasdisPageName);
                  widget.mypage.jumpToPage(3);
                  setState(() {
                    currentIndex = 3;
                  });
                },
                icon: ImageIcon(
                  AssetImage("assets/images/Group 6.png"),
                  //color: widget.iconColor,
                  color: changeColor(3, currentIndex),
                  size: widget.iconSize,
                ),
              ),
            ],
          ),
        )
    );
  }
}