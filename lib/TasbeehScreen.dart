import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TasbeehCounterDisplay.dart';
import 'package:provider/provider.dart';
import 'AppConfigProvider.dart';

class TasbeehScreen extends StatelessWidget {
  late AppConfigProvider provider;
  static const routeName = 'tasbeeh';
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: provider.isDarkTheme()? new AssetImage("assets/images/bg.png"): new AssetImage("assets/images/bg3.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    top: 100,
                    left: 160,
                    child: Container(
                      child: Image(
                        image: provider.isDarkTheme()? AssetImage('assets/images/head of seb7a.png'):AssetImage('assets/images/headofseb7a.png'),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 175,
                    left: 80,
                    child: Container(
                      child: TasbeehCounterDisplay(
                          imageToRotate: Image(
                            image: provider.isDarkTheme()? AssetImage('assets/images/body of seb7a.png'):AssetImage('assets/images/bodyofseb7a.png'),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
