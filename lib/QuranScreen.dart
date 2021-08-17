import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:quran_application/ReadQuran.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'AppConfigProvider.dart';

class QuranScreen extends StatefulWidget {

  static const routeName = "quran";

  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  late AppConfigProvider provider;
  var surasNames=[];
  var surasNums=[];
  var colorTheme = Color.fromRGBO(183, 147, 95, 1);
  var colorDarkTheme = Color.fromRGBO(252,196,64,1);

  @override
  void  initState(){
    getContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
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
                          header(AppLocalizations.of(context)!.numOfVerses,  BoxDecoration(border: Border(bottom: BorderSide(color: provider.isDarkTheme()? colorDarkTheme:colorTheme,width: 3,),top: BorderSide(color: provider.isDarkTheme()? colorDarkTheme:colorTheme,width: 3,)))),

                        ],
                      ),
                      Expanded(
                        child: ListView.builder(

                          padding: EdgeInsets.only(top: 0.0),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => buildContent(surasNames.elementAt(index), surasNums.elementAt(index), index+1),
                          itemCount: surasNames.length,
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

  Future<String> loadData(String path) async {
    return await rootBundle.loadString(path);
  }

  getContent()
  async {
    String data = await loadData('assets/content/sura_names.txt');
    surasNames=data.split("\n");
    data = await loadData('assets/content/suras_nums.txt');
    surasNums=data.split("\n");
    setState(() {});
  }

  Widget buildContent(String name, String number, int index)
  {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(border: Border(left: BorderSide(color: provider.isDarkTheme()? colorDarkTheme: colorTheme,width: 3,))),
            child: TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadQuran(displayContent(name,index,true))));
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Text(
                name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child:  Text(
              number,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ],
    );
  }

  Widget header(String text, var containerBorders)
  {
    return Expanded(
      child: Container(
        decoration: containerBorders,
        child: Center(
          child: Text(text,
            style: Theme.of(context).textTheme.headline1
          ),
        ),
      ),
    );

  }
}
