import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class RadioScreen extends StatelessWidget {
  static const routeName = "radio";
  var colorTheme = Color.fromRGBO(183, 147, 95, 1);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg3.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/radio.png"),
            SizedBox(height: 50),
            Text(AppLocalizations.of(context)!.radio,
              style: TextStyle(
                fontSize: 25,
                fontFamily: "ElMessiri",
              ),
            ),
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 70,),
               // Image.asset("assets/images/icon_prev.png"),
                IconButton(icon: Image.asset("assets/images/icon_prev.png"), color: colorTheme, onPressed: () {}),
                SizedBox(width: 55,),
                IconButton(icon: Image.asset("assets/images/icon_play.png"), color: colorTheme, onPressed: () {}),
                SizedBox(width: 55,),
                IconButton(icon: Image.asset("assets/images/icon_next.png"), color: colorTheme, onPressed: () {}),
                SizedBox(width: 55,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
