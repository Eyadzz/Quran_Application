import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TasbeehCounterDisplay.dart';
import 'ImageRotation.dart';

class TasbeehScreen extends StatelessWidget {
  static const routeName = 'tasbeeh';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/images/bg3.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text('اسلامى', textScaleFactor: 2.5),
                  ),
                  Image(
                    image: AssetImage('assets/images/headofseb7a.png'),
                  ),

                  ImageRotation(
                    imageToRotate: Image(image: AssetImage('assets/images/bodyofseb7a.png'),)
                  ),

                  Expanded(child: TasbeehCounterDisplay(label: 'سبحان الله',)),

                ]
            )
          ],
        ));
  }
}