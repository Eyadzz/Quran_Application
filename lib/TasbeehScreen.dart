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
                  Stack(
                    children: [


                         Positioned(
                           left: 3,
                           child: Container(
                             width: 500,
                             height: 120,

                             child: Image(
                              image: AssetImage('assets/images/headofseb7a.png'),
                        ),
                           ),
                         ),



                      Container(
                        width: 400,
                        height: 400,
                          child: ImageRotation(
                              imageToRotate: Image(image: AssetImage('assets/images/bodyofseb7a.png'),)
                          ),
                        ),
                    ],
                  ),

                  Expanded(child: TasbeehCounterDisplay()),

                ]
            )
          ],
        ));
  }
}
