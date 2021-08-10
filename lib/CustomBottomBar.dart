import 'package:flutter/material.dart';
import 'package:quran_application/QuranScreen.dart';
import 'package:quran_application/TasbeehScreen.dart';
class CustomBottomBar extends StatefulWidget {
  static const routeName = "home";
  final iconSize = 30.0, iconColor = Colors.white;

  final quranPageName = QuranScreen.routeName;
  final hasdisPageName = QuranScreen.routeName;
  final sebhaPageName = TasbeehScreen.routeName;
  final radioPageName = QuranScreen.routeName;


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
                  Navigator.pushReplacementNamed(context, widget.quranPageName);
                },
                icon: ImageIcon(
                  AssetImage("assets/images/moshaf_blue@3x.png"),
                  color: widget.iconColor,
                  size: widget.iconSize,
                ),
              ),
              IconButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, widget.radioPageName);
                },
                icon: ImageIcon(
                  AssetImage("assets/images/radio_blue@3x.png"),
                  color: widget.iconColor,
                  size: widget.iconSize,
                ),
              ),
              IconButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, widget.sebhaPageName);
                },
                icon: ImageIcon(
                  AssetImage("assets/images/sebha_blue@3x.png"),
                  color: widget.iconColor,
                  size: widget.iconSize,
                ),
              ),
              IconButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, widget.hasdisPageName);
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
