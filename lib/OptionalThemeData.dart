import 'package:flutter/material.dart';

class OptionalThemeData {
  static final darkThemeColor = Color.fromRGBO(252,196,64,1);
  static final lightThemeColor = Color.fromRGBO(183, 147, 95, 1);
  static final lightTheme =ThemeData(
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
        modalBackgroundColor: Colors.white
      ),
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black)
      ),
      textTheme: TextTheme(
          bodyText1: TextStyle(
            color:Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.normal,
            fontFamily: "Sultann",
          ),
        headline1: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontFamily: "ElMessiri",
        ),
          headline2: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: "ElMessiri",
          ),
        bodyText2: TextStyle(fontSize: 20,color:Colors.black,fontFamily: "DecoType", height: 2),
        headline3: TextStyle(color: Colors.white.withOpacity(1),fontFamily: "Sultann", fontSize: 20,fontWeight: FontWeight.normal,),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
      color: lightThemeColor,
  ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(183, 147, 95, 1)),
              minimumSize: MaterialStateProperty.all(Size(150,40)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color:Color.fromRGBO(183, 147, 95, 1)))))
      )
  );


  static final darkTheme =ThemeData(
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Color.fromRGBO(20, 26, 46, 1),
          modalBackgroundColor: Color.fromRGBO(20, 26, 46, 1)
      ),
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white)
      ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color:Colors.white ,
        fontSize: 25,
        fontFamily: "Sultann",
        fontWeight: FontWeight.normal,
      ),
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontFamily: "ElMessiri",
      ),
        headline2: TextStyle(
          color: darkThemeColor,
          fontSize: 25,
          fontFamily: "ElMessiri",
        ),
        bodyText2: TextStyle(fontSize: 20,color:darkThemeColor,fontFamily: "DecoType", height: 2),
          headline3: TextStyle(color: Colors.black,fontFamily: "Sultann",fontWeight: FontWeight.normal,),

  ),
    bottomAppBarTheme: BottomAppBarTheme(
    color: Color.fromRGBO(20, 26, 46, 1),
  ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(252,196,64,1)),
              minimumSize: MaterialStateProperty.all(Size(150,40)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color:Color.fromRGBO(252,196,64,1)))))
      )
  );

}