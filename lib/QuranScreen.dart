import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:quran_application/ReadQuran.dart';

class QuranScreen extends StatefulWidget {

  static const routeName = "quran";

  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  var surasNames=[];
  var surasNums=[];
  var colorTheme = Color.fromRGBO(183, 147, 95, 1);
  var textContentStyle = TextStyle(
    fontSize: 25,
    color: Colors.black,
    fontFamily: "Sultann",

  );

  @override
  void  initState(){
    getContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
        Container(
          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/images/bg3.png"),
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
                      header("عدد الآيات",  BoxDecoration(border: Border(bottom: BorderSide(color: colorTheme,width: 3,),top: BorderSide(color: colorTheme,width: 3,)))),
                      header("اسم السورة", BoxDecoration(border: Border(left: BorderSide(color: colorTheme,width: 3,),bottom: BorderSide(color: colorTheme,width: 3,),top: BorderSide(color: colorTheme,width: 3,)))),
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
  }

  Widget buildContent(String name, String number, int index)
  {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              number,
              style: textContentStyle,
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(border: Border(left: BorderSide(color: colorTheme,width: 3,))),
            child: TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadQuran(setSurah(name,index))));
                },
                style: TextButton.styleFrom(
                 padding: EdgeInsets.zero,
                ),
                child: Text(
                  name,
                  style: textContentStyle,
                )
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
            ),
          ),
        ),
      ),
    );

  }
}
