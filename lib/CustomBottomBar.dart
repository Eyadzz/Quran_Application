import 'package:flutter/material.dart';
import 'package:quran_application/QuranScreen.dart';
import 'package:quran_application/TasbeehScreen.dart';
import 'package:quran_application/HadethScreen.dart';
class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar ({Key? key, this.mypage}) : super(key: key);
  static const routeName = "home";
  final iconSize = 100.0, iconColor = Colors.white;

  final quranPageName = QuranScreen.routeName;
  final hadisPageName = HadethScreen.routeName;
  final sebhaPageName = TasbeehScreen.routeName;
  final radioPageName = QuranScreen.routeName;

  final mypage;
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      //color: Color(0x46352b),
        color:  Color.fromRGBO(183, 147, 95, 1),
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
                },
                icon: ImageIcon(
                  AssetImage("assets/images/moshaf_blue@3x.png"),
                  color: widget.iconColor,
                  size: widget.iconSize,
                ),
              ),
              IconButton(
                onPressed: (){
                  //Navigator.pushReplacementNamed(context, widget.radioPageName);
                  widget.mypage.jumpToPage(1);
                },
                icon: ImageIcon(
                  AssetImage("assets/images/radio_blue@3x.png"),
                  color: widget.iconColor,
                  size: widget.iconSize,
                ),
              ),
              IconButton(
                onPressed: (){
                  //Navigator.pushReplacementNamed(context, widget.sebhaPageName);
                  widget.mypage.jumpToPage(2);
                },
                icon: ImageIcon(
                  AssetImage("assets/images/sebha_blue@3x.png"),
                  color: widget.iconColor,
                  size: widget.iconSize,
                ),
              ),
              IconButton(
                onPressed: (){
                  //Navigator.pushReplacementNamed(context, widget.hadisPageName);
                  widget.mypage.jumpToPage(3);
                },
                icon: ImageIcon(
                  AssetImage("assets/images/moshaf@3x.png"),
                  color: widget.iconColor,
                  size: widget.iconSize,
                ),
              ),
            ],
          ),
        )
    );
  }
}
