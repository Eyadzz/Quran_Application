import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quran_application/tabs/ContentViewer/ContentViewer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../utility/AppConfigProvider.dart';
import '../../utility/FileOperations.dart';

import 'dart:math' as math;


class QuranScreen extends StatefulWidget {

  static const routeName = "quran";


  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {

  late AppConfigProvider provider;
  late bool isRTL;
  var surahsNames=[];
  var surahsVerses=[];
  var colorTheme = Color.fromRGBO(183, 147, 95, 1);
  var colorDarkTheme = Color.fromRGBO(252,196,64,1);

  @override
  void  initState(){
    getSurahContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    provider = Provider.of<AppConfigProvider>(context);
    final TextDirection currentDirection = Directionality.of(context);
    isRTL = currentDirection == TextDirection.rtl;

    return Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: provider.isDarkTheme()? AssetImage("assets/images/bg.png"): AssetImage("assets/images/bg3.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/moshaf.png"),
                  ],
                ),
                SizedBox(height: 15),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          header(AppLocalizations.of(context)!.surahName, BoxDecoration(border: Border(left: BorderSide(color: provider.isDarkTheme()? colorDarkTheme:colorTheme,width: 3,),bottom: BorderSide(color: provider.isDarkTheme()? colorDarkTheme:colorTheme,width: 3,),top: BorderSide(color: provider.isDarkTheme()? colorDarkTheme:colorTheme,width: 3,)))),
                          header(AppLocalizations.of(context)!.numOfVerses, BoxDecoration(border: Border(bottom: BorderSide(color: provider.isDarkTheme()? colorDarkTheme:colorTheme,width: 3,),top: BorderSide(color: provider.isDarkTheme()? colorDarkTheme:colorTheme,width: 3,)))),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 0.0),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => surahListBuilder(surahsNames.elementAt(index), surahsVerses.elementAt(index), index+1),
                          itemCount: surahsNames.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        )
    );
  }

  getSurahContent()
  async {
    FileOperations FO = new FileOperations();
    String data = await FO.getDataFromFile('assets/content/sura_names.txt');;
    surahsNames=data.split("\n");
    data = await FO.getDataFromFile('assets/content/suras_nums.txt');
    surahsVerses=data.split("\n");
    setState(() {});
  }

  Widget surahListBuilder(String surahName, String surahVerses, int index)
  {
    return Row(
      children: [
        Expanded(
          child: Transform(
            transform: Matrix4.rotationY(!isRTL ? math.pi : 0),
            alignment: AlignmentDirectional.center,
            child: Container(
              decoration: BoxDecoration(border: Border(left: BorderSide(color: provider.isDarkTheme()? colorDarkTheme: colorTheme,width: 3,))),
              child: TextButton(
                onPressed: (){
                  //Navigator.pushNamed(context,ReadQuran.routeName,arguments: ReadQuran(surahName,index,true));
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ContentViewer(surahName,index,true)));
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

  Widget header(String title, var containerBorders)
  {
    return Expanded(
      child: Transform(
        transform: Matrix4.rotationY(!isRTL ? math.pi : 0),
        alignment: AlignmentDirectional.center,
        child: Container(
          decoration: containerBorders,
          child: Center(
            child: Transform(
              transform: Matrix4.rotationY(!isRTL ? math.pi : 0),
              alignment: AlignmentDirectional.center,
              child: Text(title,
                style: Theme.of(context).textTheme.headline1
              ),
            ),
          ),
        ),
      ),
    );

  }
}
