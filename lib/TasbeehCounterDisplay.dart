import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TasbeehCounterDisplay extends StatefulWidget {
  TasbeehCounterDisplay({Key? key}) : super(key: key);

  @override
  _TasbeehCounterDisplayState createState() => _TasbeehCounterDisplayState();
}

class _TasbeehCounterDisplayState extends State<TasbeehCounterDisplay> {
  int _tasbeehCounter = 0;
   String tasbeehButtonLabel = 'سبحان الله';


  void _incrementTasbeehCounter() {
    setState(() {
      if (_tasbeehCounter == 33) {
        _tasbeehCounter = 0;
        if(tasbeehButtonLabel == 'سبحان الله'){
          tasbeehButtonLabel = 'الحمد لله';
        }else if(tasbeehButtonLabel == 'الحمد لله'){
          tasbeehButtonLabel = 'الله اكبر';
        }else{
          tasbeehButtonLabel = 'سبحان الله';
        }
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
            child: Text('$_tasbeehCounter',textScaleFactor: 1.6),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal),
                fixedSize: MaterialStateProperty.all(Size(70, 80)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(color: Colors.teal))))
        ),
        ElevatedButton(
            onPressed: _incrementTasbeehCounter,
            child: Text(tasbeehButtonLabel,textScaleFactor: 1.6),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                fixedSize: MaterialStateProperty.all(Size(150, 40)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(color: Colors.green))))
        )
      ],
    );
  }
}