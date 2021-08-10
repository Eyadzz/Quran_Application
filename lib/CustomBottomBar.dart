import 'package:flutter/material.dart';
import 'SplashCustom.dart';
import 'Home.dart';
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({Key key}) : super(key: key);
  static const routeName = "home";
  final iconSize = 30.0, iconColor = Colors.white;

  final quranPageName = Home.routeName;
  final hasdisPageName = Home.routeName;
  final sebhaPageName = SplashCustom.routeName;
  final radioPageName = Home.routeName;


  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      //color: Color(0x46352b),
        color: Colors.brown,
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
