import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class QuranScreen extends StatefulWidget {

  static const routeName = "quran";

  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  var surasNames=[];
  var surasNums=[];
  var colorTheme = Color.fromRGBO(183, 147, 95, 1);

  @override
  Widget build(BuildContext context) {
    getContent();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("إسلامي", style: TextStyle(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.bold,
          fontFamily: "ElMessiri",
        ),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
            SizedBox(height: 80,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/moshaf.png"),
              ],
            ),
            SizedBox(height: 15,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 3, width: double.infinity, color: colorTheme,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text("عدد الآيات",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Monotype-Koufi",
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text("اسم السورة",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Monotype-Koufi",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(height: 3, width: double.infinity, color: colorTheme,),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: 0.0),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index)
                            {
                              return buildContent(surasNames.elementAt(index), surasNums.elementAt(index));
                            },
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

  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  getContent()
  async {
    String data = await loadAsset('assets/content/sura_names.txt');
    surasNames=data.split("\n");
    data = await loadAsset('assets/content/suras_nums.txt');
    surasNums=data.split("\n");
  }

  Widget buildContent(String name, String number)
  {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(border: Border(left: BorderSide(color: colorTheme,width: 3,))),
            child: TextButton(
                onPressed: null,
                style: TextButton.styleFrom(
                 padding: EdgeInsets.zero,
                ),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )
            ),
          ),
        ),
      ],
    );
  }
}
