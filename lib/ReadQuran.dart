
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
    surahText+=" ("+AyahNum.toString()+") ";
    surahText+=line;
    AyahNum++;
  }
  return surahText;
}
class _ReadQuranState extends State<ReadQuran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,size: 30,), onPressed: (){Navigator.pop(context);},),
        title: Text("إسلامي", style: TextStyle(
          color: Colors.black,
          fontSize: 35,
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
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      scale: 1.1,
                      image: AssetImage("assets/images/Rectangle 3.png",)
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  SizedBox(height:100),
                  Text(SurahName, style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50,0,50,0),
                    child: Container(
                      height: 3,
                        color: Color.fromRGBO(183, 147, 95, 1),
                        ),
                  ),
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
                                      Text(lines.data!,style: TextStyle(fontSize: 20))
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
    String data = await rootBundle.loadString('assets/txts/$NumOfSurah.txt');
    List<String> lines = data.split('\n');
    return ConcreteSurahDisplay(lines);
  }
}
