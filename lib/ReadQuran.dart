import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'AppConfigProvider.dart';

class ReadQuran extends StatefulWidget {
  const ReadQuran(setSurah, {key}) : super(key: key);

  @override
  _ReadQuranState createState() => _ReadQuranState();
}
const String routeName="ReadQuran";
String SurahName="";
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
    surahText+="("+AyahNum.toString()+") ";
    AyahNum++;
  }
  return surahText;
}
class _ReadQuranState extends State<ReadQuran> {
  late AppConfigProvider provider;
  var colorDarkTheme = Color.fromRGBO(252,196,64,1);
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back, color: provider.isDarkTheme()? Colors.white:Colors.black,size: 30,), onPressed: (){Navigator.pop(context);},),
        title: Text("إسلامي", style: TextStyle(
          color: provider.isDarkTheme()? Colors.white: Colors.black,
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
              image: provider.isDarkTheme()? AssetImage("assets/images/bg.png"): AssetImage("assets/images/bg3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    scale: 1.1,
                    image: provider.isDarkTheme()? AssetImage("assets/images/Rectangle_darkTheme.png"):AssetImage("assets/images/Rectangle 3.png"),
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  SizedBox(height:100),
                  Text(SurahName, style: TextStyle(color: provider.isDarkTheme()? colorDarkTheme:Colors.black ,fontSize: 35,fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50,0,50,0),
                    child: Container(
                      height: 3,
                      color: provider.isDarkTheme()? colorDarkTheme:Color.fromRGBO(183, 147, 95, 1),
                    ),
                  ),
                  new Expanded(
                      flex: 1,
                      child:new Container(
                          margin: EdgeInsets.fromLTRB(40, 40, 40,100),
                          child: new SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: new FutureBuilder(
                                  future: ReadData(SurahNum),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<String>lines) {
                                    if(lines.data!=null){
                                      return new Directionality(textDirection: TextDirection.rtl, child:
                                      Text(lines.data! ,style: TextStyle(fontSize: 20,color: provider.isDarkTheme()? colorDarkTheme:Colors.grey,))
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
