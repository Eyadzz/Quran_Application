import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TasbeehCounterDisplay.dart';

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
                              image: AssetImage('assets/images/headofseb7a.png'),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 175,
                          left: 80,
                          child: Container(
                            child: TasbeehCounterDisplay(
                                imageToRotate: Image(
                                  image: AssetImage('assets/images/bodyofseb7a.png'),
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
