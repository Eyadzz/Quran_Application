import 'package:flutter/material.dart';
import 'package:quran_application/tabs/ContentViewer/ContentViewer.dart';

class HadethItem extends StatelessWidget {

  String name;
  int fileNumber;

  HadethItem(this.name,this.fileNumber);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ContentViewer(name,(fileNumber+1000),false)));
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(8.0),
              ),
              child: Text(
                name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
