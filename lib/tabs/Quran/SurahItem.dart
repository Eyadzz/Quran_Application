import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:quran_application/tabs/ContentViewer/ContentViewer.dart';

class SurahItem extends StatelessWidget {

  bool isRTL;
  var borderColor;
  String surahName;
  String surahVerses;
  int fileNumber;

  SurahItem(this.surahName,this.surahVerses,this.fileNumber,this.borderColor,this.isRTL);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Transform(
            transform: Matrix4.rotationY(!isRTL ? math.pi : 0),
            alignment: AlignmentDirectional.center,
            child: Container(
              decoration: BoxDecoration(border: Border(left: BorderSide(color: borderColor,width: 3,))),
              child: TextButton(
                onPressed: (){
                  //Navigator.pushNamed(context,ReadQuran.routeName,arguments: ReadQuran(surahName,index,true));
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ContentViewer(surahName,fileNumber,true)));
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Transform(
                  transform: Matrix4.rotationY(!isRTL ? math.pi : 0),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    surahName,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              surahVerses,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ],
    );
  }
}
