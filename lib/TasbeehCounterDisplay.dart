import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    var textContentStyle = TextStyle(
      fontSize: 25,
      color: Colors.black,
      fontFamily: "Sultann",

    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap:(){
            rotate = !rotate;
            _incrementTasbeehCounter();
        },
          child: Container(
            alignment: Alignment.center,
            child:Transform(
              transform: Matrix4.rotationX((rotate ? 0 : -2) * 3.14159 / 2),
              alignment: Alignment.center,
              child: Container(
                child: imageToRotate,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(AppLocalizations.of(context)!.numOfTasbeehat,style: textContentStyle),
        SizedBox(
          height: 20,
        ),

        Container(
          width: 60,
          height: 80,
          decoration: BoxDecoration(
            color: Color.fromRGBO(183, 147, 95, 1).withAlpha(100),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            '$_tasbeehCounter',
            textScaleFactor: 1.6,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black.withOpacity(0.6),height: 2.5),
          ),
        ),
        SizedBox(
          height: 10,
        ),

        Container(
          width: 150,
          height: 40,
          decoration: BoxDecoration(
            color: Color.fromRGBO(183, 147, 95, 1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(tasbeehButtonLabel,
              textScaleFactor: 1.6,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white.withOpacity(1))),
        ),
      ],
    );
  }
}
