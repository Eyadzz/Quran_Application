import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class ImageRotation extends StatefulWidget {
  const ImageRotation({Key? key, required this.imageToRotate}) : super(key: key);
  final Image imageToRotate;


  @override
  _ImageRotationState createState() => _ImageRotationState();
}

class _ImageRotationState extends State<ImageRotation> {

  late Image imageToRotate ;
  bool showFront = true;

  @override
  void initState() {
    super.initState();
    imageToRotate = widget.imageToRotate;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(imageToRotate.image, context);
  }


  @override
  Widget build(BuildContext context) {
    Widget imageRotation = Transform(
      transform: Matrix4.rotationX(
          (showFront ? 0 : -2) *  3.14159/ 2
      ),
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        child: imageToRotate,
      ),
    );

    return Container(

          child:GestureDetector(
            child: imageRotation,
            onTap: () {
              setState(() {
                showFront = !showFront;
              });
            },


          ),

      );
  }
}
