import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';


class ReadQuran extends StatefulWidget {
  const ReadQuran(setSurah, {key}) : super(key: key);

  @override
  _ReadQuranState createState() => _ReadQuranState();
}
const String routeName="ReadQuran";
String SurahName="الفاتحة";
int SurahNum=0;


setSurah(String Surah_Name,int Surah_Num){
  SurahName=Surah_Name;
  SurahNum=Surah_Num;
}
int AyahNum=0;

String ConcreteSurahDisplay(List<String>Surah){
  String surahText='';
  AyahNum=1;
  for(var line in Surah){
    surahText+=line;
    surahText+=" ("+AyahNum.toString()+") ";
    AyahNum++;
  }
  return surahText;
}
class _ReadQuranState extends State<ReadQuran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: AssetImage("assets/images/Rectangle 3.png",)
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  SizedBox(height:150),
                  Text(SurahName, style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold)),
                  Container(
                      decoration: BoxDecoration(
                      image: DecorationImage(
                         fit: BoxFit.contain,
                          image: AssetImage("assets/images/Line 4.png")
                      )
                  )),
                  SizedBox(height:10),
                new Expanded(
                      flex: 1,
                      child:new Container(
                       margin: EdgeInsets.fromLTRB(40, 40, 40,80),
                          child: new SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: new FutureBuilder(
                            future: ReadData(SurahNum),
                            builder: (BuildContext context,
                                AsyncSnapshot<String>lines) {
                              if(lines.data!=null){
                                return new Directionality(textDirection: TextDirection.rtl, child:
                                  Text(lines.data,style: TextStyle(fontSize: 20))
                                );
                              }
                              else{
                                return new Text('Nothing to show');
                              }}
                        )
                      )
                    )
                )
                ],
                  )
              )
          ),
    );
  }

  Future<String> ReadData(int NumOfSurah) async {
    try {
      String data = await rootBundle.loadString('assets/txts/$NumOfSurah.txt');
      List<String> lines = data.split('\n');
      return ConcreteSurahDisplay(lines);
    } catch (e) {}
  }
}
