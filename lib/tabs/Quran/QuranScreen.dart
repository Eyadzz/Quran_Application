import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quran_application/tabs/Quran/SurahItem.dart';
import '../../utility/AppConfigProvider.dart';
import '../../utility/FileOperations.dart';
import '../../components/Header.dart';


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
  late var borderColor;
  late var containerBorder = BorderSide(color: borderColor, width: 3);

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
    borderColor = provider.isDarkTheme()? colorDarkTheme:colorTheme;

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
                          Header(AppLocalizations.of(context)!.surahName, BoxDecoration(border: Border(left: BorderSide(color: borderColor, width: 3),bottom: BorderSide(color: borderColor, width: 3),top: BorderSide(color: borderColor, width: 3))), isRTL),
                          Header(AppLocalizations.of(context)!.numOfVerses, BoxDecoration(border: Border(bottom: BorderSide(color: borderColor, width: 3),top: BorderSide(color: borderColor, width: 3))), isRTL),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 0.0),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => SurahItem(surahsNames.elementAt(index), surahsVerses.elementAt(index), index+1, borderColor, isRTL),
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
}
