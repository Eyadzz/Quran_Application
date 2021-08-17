import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ReadQuran extends StatefulWidget {
  const ReadQuran(setSurah, {key}) : super(key: key);

  @override
  _ReadQuranState createState() => _ReadQuranState();
}
const String routeName="ReadQuran";
String Name="";
int Num=0;
bool isSurah=true;

displayContent(String name,int num, bool is_Surah){
  Name=name;
  Num=num;
  isSurah = is_Surah;
}
int AyahNum=0;

String ConcreteSurahDisplay(String data){

  if(isSurah) {
    List<String> Surah = data.split('\n');
    String surahText = '';
    AyahNum = 1;
    for (var line in Surah) {
      surahText += line;
      surahText += " (" + AyahNum.toString() + ") ";
      AyahNum++;
    }
    return surahText;
  }
  else
   return data;
}
class _ReadQuranState extends State<ReadQuran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,size: 30,), onPressed: (){Navigator.pop(context);},),
        title: Text(AppLocalizations.of(context)!.title, style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: "ElMessiri",
        ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body:  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg3.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      scale: 1.12,
                      image: AssetImage("assets/images/Rectangle 3.png",)
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  SizedBox(height:120),
                  Text(Name, style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
                  Container(
                      height: 1,
                      width: 270,
                      color: Color.fromRGBO(183, 147, 95, 1),
                      ),
                  new Expanded(
                      flex: 1,
                      child:new Container(
                          margin: EdgeInsets.fromLTRB(40, 40, 40,100),
                          child: new SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: new FutureBuilder(
                                    future: ReadData(Num),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<String>lines) {
                                      if(lines.data!=null){
                                        return new Directionality(textDirection: TextDirection.rtl, child:
                                        Text(lines.data!,style: TextStyle(fontSize: 20, fontFamily: "DecoType"))
                                        );
                                      }
                                      else{
                                        return new Text('Nothing to show');
                                      }}
                                ),
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
    String data = await rootBundle.loadString('assets/txts/$NumOfSurah.txt');
    return ConcreteSurahDisplay(data);
  }
}
