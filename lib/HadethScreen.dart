import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:quran_application/ReadQuran.dart';
import 'package:provider/provider.dart';
import 'AppConfigProvider.dart';

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
  var textContentStyle = TextStyle(
    fontSize: 25,
    color: Colors.black,
    fontFamily: "Sultann",

  );
  var textContentStyleDarkTheme = TextStyle(
    fontSize: 25,
    color: Colors.white,
    fontFamily: "Sultann",

  );

  @override
  void  initState(){
    getContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
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
                          header("الاحاديث", BoxDecoration(border: Border(bottom: BorderSide(color: provider.isDarkTheme()? colorDarkTheme:colorTheme,width: 3,),top: BorderSide(color: provider.isDarkTheme()? colorDarkTheme:colorTheme,width: 3,)))),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 0.0),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => buildContent(hadethName.elementAt(index),index+1),
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

  Future<String> loadFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  getContent()
  async {
    String data = await loadFileData('assets/content/hades_names.txt');
    hadethName=data.split("\n");
    setState(() {});
  }

  Widget buildContent(String name,int index)
  {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadQuran(displayContent(name,index+1000,false))));
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(8.0),
              ),
              child: provider.isDarkTheme()? Text(
                name,
                style: textContentStyleDarkTheme,
              ): Text (name,style: textContentStyle),
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
            style: TextStyle(
              fontSize: 25,
              fontFamily: "ElMessiri",
              color: provider.isDarkTheme()? Colors.white:Colors.black,
            ),
          ),
        ),
      ),
    );

  }
}