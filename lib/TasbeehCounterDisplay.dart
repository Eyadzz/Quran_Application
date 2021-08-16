import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TasbeehCounterDisplay extends StatefulWidget {
  TasbeehCounterDisplay({Key? key, required this.imageToRotate})
      : super(key: key);
  final Image imageToRotate;

  @override
  _TasbeehCounterDisplayState createState() => _TasbeehCounterDisplayState();
}

class _TasbeehCounterDisplayState extends State<TasbeehCounterDisplay> {
  int _tasbeehCounter = 0;
  String tasbeehButtonLabel = 'سبحان الله';
  late Image imageToRotate;
  bool rotate = true;

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

  void _changeTasbeehButtonDisplay() {
    if (tasbeehButtonLabel == 'سبحان الله') {
      tasbeehButtonLabel = 'الحمد لله';
    } else if (tasbeehButtonLabel == 'الحمد لله') {
      tasbeehButtonLabel = 'الله اكبر';
    } else {
      tasbeehButtonLabel = 'سبحان الله';
    }
  }

  void _incrementTasbeehCounter() {
    setState(() {
      if (_tasbeehCounter == 33) {
        _tasbeehCounter = 0;
        _changeTasbeehButtonDisplay();
      } else {
        _tasbeehCounter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
          child: Transform(
            transform: Matrix4.rotationX((rotate ? 0 : -2) * 3.14159 / 2),
            alignment: Alignment.center,
            child: Container(
              child: imageToRotate,
            ),
          ),
          onTap: () {
            setState(() {
              rotate = !rotate;
              _incrementTasbeehCounter();
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        Text('عدد التسبيحات', textScaleFactor: 2.5),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: null,
            child: Text(
              '$_tasbeehCounter',
              textScaleFactor: 1.6,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromRGBO(183, 147, 95, 1).withAlpha(100)),
                minimumSize: MaterialStateProperty.all(Size(60, 80)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                )))),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: null,
            child: Text(tasbeehButtonLabel,
                textScaleFactor: 1.6,
                style: TextStyle(color: Colors.white.withOpacity(1))),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromRGBO(183, 147, 95, 1)),
                minimumSize: MaterialStateProperty.all(Size(150, 40)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(
                            color: Color.fromRGBO(183, 147, 95, 1))))))
      ],
    );
  }
}
