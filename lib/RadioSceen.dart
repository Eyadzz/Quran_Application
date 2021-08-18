import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppConfigProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;


class RadioScreen extends StatelessWidget {

  late AppConfigProvider provider;
  static const routeName = "radio";
  var colorTheme = Color.fromRGBO(183, 147, 95, 1);

  @override
  Widget build(BuildContext context) {

    provider = Provider.of<AppConfigProvider>(context);
    final TextDirection currentDirection = Directionality.of(context);
    final bool isRTL = currentDirection == TextDirection.rtl;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: provider.isDarkTheme()? AssetImage("assets/images/bg.png"):AssetImage("assets/images/bg3.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Image.asset("assets/images/radio.png"),
            SizedBox(height: 50),
            Text(
              AppLocalizations.of(context)!.radio,
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 50,),
                Expanded(
                  child: Transform(
                      transform: Matrix4.rotationY(!isRTL ? math.pi : 0),
                      alignment: AlignmentDirectional.center,
                      child: IconButton(
                          icon: provider.isDarkTheme()?Image.asset("assets/images/icon_next_dark.png"):Image.asset("assets/images/icon_next.png"),
                          color: colorTheme,
                          onPressed: () {}
                          )
                  ),
                ),
                Expanded(
                    child: IconButton(
                        icon: provider.isDarkTheme()?Image.asset("assets/images/icon_play_dark.png"):Image.asset("assets/images/icon_play.png"),
                        color: colorTheme,
                        onPressed: () {}),
                ),
                Expanded(
                  child: Transform(
                      transform: Matrix4.rotationY(!isRTL ? math.pi : 0),
                      alignment: AlignmentDirectional.center,
                      child: IconButton(
                          icon: provider.isDarkTheme()?Image.asset("assets/images/icon_prev_dark.png"):Image.asset("assets/images/icon_prev.png"),
                          color: colorTheme,
                          onPressed: () {}
                          ),
                  ),
                ),
                SizedBox(width: 50,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
