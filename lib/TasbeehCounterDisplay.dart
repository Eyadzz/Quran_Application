import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TasbeehCounterDisplay extends StatefulWidget {
  TasbeehCounterDisplay({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  _TasbeehCounterDisplayState createState() => _TasbeehCounterDisplayState();
}

class _TasbeehCounterDisplayState extends State<TasbeehCounterDisplay> {
  int _tasbeehCounter = 0;

  void _incrementTasbeehCounter() {
    setState(() {
      if (_tasbeehCounter == 30) {
        _tasbeehCounter = 0;
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

        Text('عدد التسبيحات', textScaleFactor: 2.5),

        ElevatedButton(
            onPressed: null,
            child: Text('$_tasbeehCounter',textScaleFactor: 1.6, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromRGBO(183, 147, 95, 0.7)),
                //fixedSize: MaterialStateProperty.all(Size(70, 80)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(color: Color.fromRGBO(183, 147, 95, 0.7)))))
        ),
        ElevatedButton(
            onPressed: _incrementTasbeehCounter,
            child: Text(widget.label,textScaleFactor: 1.6, style: TextStyle(fontWeight: FontWeight.bold)),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromRGBO(183, 147, 95, 1)),
                //fixedSize: MaterialStateProperty.all(Size(150, 40)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(color: Color.fromRGBO(183, 147, 95, 1)))))
        )
      ],
    );
  }
}