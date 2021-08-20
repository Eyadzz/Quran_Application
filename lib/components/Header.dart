import 'package:flutter/material.dart';
import 'dart:math' as math;

class Header extends StatelessWidget {

  bool isRTL;
  var containerBorders;
  String title;

  Header(this.title, this.containerBorders,this.isRTL);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Transform(
        transform: Matrix4.rotationY(!isRTL ? math.pi : 0),
        alignment: AlignmentDirectional.center,
        child: Container(
          decoration: containerBorders,
          child: Center(
            child: Transform(
              transform: Matrix4.rotationY(!isRTL ? math.pi : 0),
              alignment: AlignmentDirectional.center,
              child: Text(title,
                  style: Theme.of(context).textTheme.headline1
              ),
            ),
          ),
        ),
      ),
    );
  }
}
