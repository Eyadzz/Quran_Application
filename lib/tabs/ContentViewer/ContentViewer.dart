import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quran_application/utility/FileOperations.dart';
import '../../utility/AppConfigProvider.dart';
import 'ContentViewerArgs.dart';

class ContentViewer extends StatefulWidget {
  static const String routeName="ContentViewer";
  int ayahNum=0;
  @override
  _ContentViewerState createState() => _ContentViewerState();
}


class _ContentViewerState extends State<ContentViewer> {
  late AppConfigProvider provider;
  var colorDarkTheme = Color.fromRGBO(252,196,64,1);
  var colorTheme = Color.fromRGBO(183, 147, 95, 1);
  late var args;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    args = ModalRoute.of(context)!.settings.arguments as ContentViewerArgs;
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
      body: Container(
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
                  Text(args.title, style: Theme.of(context).textTheme.headline2),
                  Container(
                    height: 1,
                    width: 270,
                    color: provider.isDarkTheme()? colorDarkTheme: colorTheme,
                  ),
                  new Expanded(
                      flex: 1,
                      child:new Container(
                          margin: EdgeInsets.fromLTRB(40, 10, 40,120),
                          child: new SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: new FutureBuilder(
                                    future: getContent(args.fileNumber),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<String>lines) {
                                      if(lines.data!=null){
                                        return new Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Text(
                                                lines.data! ,
                                                style: Theme.of(context).textTheme.bodyText2
                                            )
                                        );
                                      }
                                      else{
                                        return Center(child: CircularProgressIndicator());
                                      }
                                    }
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

  Future<String> getContent(int NumOfSurah) async {
    FileOperations fileOperations = new FileOperations();
    String data = await fileOperations.getDataFromFile('assets/txts/$NumOfSurah.txt');
    return formatContent(data);
  }

  String formatContent(String content){
    if(args.isSurah) {
      List<String> Surah = content.split('\n');
      String surahText = '';
      widget.ayahNum = 1;
      for (var line in Surah) {
        surahText += line;
        surahText += " (" + widget.ayahNum.toString() + ") ";
        widget.ayahNum++;
      }
      return surahText;
    }
    else
      return content;
  }
}
