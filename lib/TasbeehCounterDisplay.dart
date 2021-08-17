import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppConfigProvider.dart';

class TasbeehCounterDisplay extends StatefulWidget {
  TasbeehCounterDisplay({Key? key, required this.imageToRotate}) : super(key: key);
  final Image imageToRotate;

  @override
  _TasbeehCounterDisplayState createState() => _TasbeehCounterDisplayState();
}

class _TasbeehCounterDisplayState extends State<TasbeehCounterDisplay> {
  late AppConfigProvider provider;
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
    provider = Provider.of<AppConfigProvider>(context);

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
        Text('عدد التسبيحات',style: Theme.of(context).textTheme.headline1,),
        SizedBox(
          height: 20,
        ),

        ElevatedButton(
            onPressed: null,
            child: Text(
              '$_tasbeehCounter',
              textScaleFactor: 1.6,
              style: TextStyle(color: provider.isDarkTheme()? Colors.white: Colors.black.withOpacity(0.6), fontWeight: FontWeight.bold),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    provider.isDarkTheme()?Color.fromRGBO(20, 26,46, 1) : Color.fromRGBO(183, 147, 95, 1).withAlpha(100)),
                minimumSize: MaterialStateProperty.all(Size(60,80)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    )))),
        SizedBox(
          height: 10,
        ),

        ElevatedButton(
            onPressed: null,
            child: Text(tasbeehButtonLabel, textScaleFactor: 1.6,style: TextStyle(color: provider.isDarkTheme()? Colors.black: Colors.white.withOpacity(1),fontFamily: "Sultann",)),
            )
      ],
    );
  }
}