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
              image: provider.isDarkTheme()? AssetImage("assets/images/bg.png"): AssetImage("assets/images/bg3.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    scale: 1.12,
                    image: provider.isDarkTheme()? AssetImage("assets/images/Rectangle_darkTheme.png"):AssetImage("assets/images/Rectangle 3.png"),
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  SizedBox(height:120),
                  Text(Name, style: Theme.of(context).textTheme.headline2),
                  Container(
                    height: 1,
                    width: 270,
                    color: provider.isDarkTheme()? colorDarkTheme: Color.fromRGBO(183, 147, 95, 1),
                  ),
                  new Expanded(
                      flex: 1,
                      child:new Container(
                          margin: EdgeInsets.fromLTRB(40, 10, 40,100),
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
                                        Text(lines.data! ,style: Theme.of(context).textTheme.bodyText2)
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
