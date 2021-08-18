import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'AppConfigProvider.dart';

class ReadQuran extends StatefulWidget {
  String Name="";
  int Num=0;
  bool isSurah=true;
  int AyahNum=0;
  ReadQuran(String name,int num, bool is_Surah){
    Name=name;
    Num=num;
    isSurah = is_Surah;
  }
  @override
  _ReadQuranState createState() => _ReadQuranState();
}

const String routeName="ReadQuran";

class _ReadQuranState extends State<ReadQuran> {



  String ConcreteSurahDisplay(String data){
    if(widget.isSurah) {
      List<String> Surah = data.split('\n');
      String surahText = '';
      widget.AyahNum = 1;
      for (var line in Surah) {
        surahText += line;
        surahText += " (" + widget.AyahNum.toString() + ") ";
        widget.AyahNum++;
      }
      return surahText;
    }
    else
      return data;
  }

  late AppConfigProvider provider;
  var colorDarkTheme = Color.fromRGBO(252,196,64,1);
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back, color: provider.isDarkTheme()? Colors.white:Colors.black,size: 30,), onPressed: (){Navigator.pop(context);},),
        title: Text(AppLocalizations.of(context)!.title, style: TextStyle(
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
                  Text(widget.Name, style: Theme.of(context).textTheme.headline2),
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
                                padding: const EdgeInsets.all(17.0),
                                child: new FutureBuilder(
                                    future: ReadData(widget.Num),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<String>lines) {
                                      if(lines.data!=null){
                                        return new Directionality(textDirection: TextDirection.rtl, child:
                                        Text(lines.data! ,style: Theme.of(context).textTheme.bodyText2)
                                        );
                                      }
                                      else{
                                        return new Text(AppLocalizations.of(context)!.nothingtoshow);
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
