import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'HadethItem.dart';
import '../../components/Header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quran_application/utility/FileOperations.dart';
import '../../utility/AppConfigProvider.dart';

class HadethScreen extends StatefulWidget {

  static const routeName = "hadeth";

  @override
  _HadethState createState() => _HadethState();
}

class _HadethState extends State<HadethScreen> {
  late AppConfigProvider provider;
  var hadethName=[];
  var colorTheme = Color.fromRGBO(183, 147, 95, 1);
  var colorDarkTheme = Color.fromRGBO(252,196,64,1);
  late var borderColor;
  @override
  void  initState(){
    getHadethContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    provider = Provider.of<AppConfigProvider>(context);
    borderColor =  provider.isDarkTheme()? colorDarkTheme:colorTheme;

    return Scaffold(
        extendBodyBehindAppBar: true,
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
                    Image.asset("assets/images/asset-1.png"),
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
                          Header(AppLocalizations.of(context)!.hadith, BoxDecoration(border: Border(bottom: BorderSide(color:borderColor,width: 3,),top: BorderSide(color: borderColor,width: 3,))),true),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 0.0),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => HadethItem(hadethName.elementAt(index),index+1),
                          itemCount: hadethName.length,
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

  getHadethContent()
  async {
    FileOperations fileOperations= new FileOperations();
    String data = await fileOperations.getDataFromFile('assets/content/hades_names.txt');
    hadethName=data.split("\n");
    setState(() {});
  }
}