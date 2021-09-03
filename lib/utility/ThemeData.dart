import 'package:flutter/material.dart';

class ThemeDataProvider {
  static final primaryDarkThemeColor = Color.fromRGBO(252,196,64,1);
  static final secondaryDarkThemeColor = Color.fromRGBO(20, 26, 46, 1);
  static final primaryLightThemeColor = Color.fromRGBO(183, 147, 95, 1);
  static final secondaryLightThemeColor = Colors.black;

  static final lightTheme =
  ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
        modalBackgroundColor: Colors.white
      ),

      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: secondaryLightThemeColor)
      ),

      textTheme: TextTheme(
          bodyText1: TextStyle(
            color:secondaryLightThemeColor,
            fontSize: 25,
            fontWeight: FontWeight.normal,
            fontFamily: "Sultann",
          ),
          headline1: TextStyle(
            color: secondaryLightThemeColor,
            fontSize: 25,
            fontFamily: "ElMessiri",
          ),
          headline2: TextStyle(
            color: secondaryLightThemeColor,
            fontSize: 25,
            fontFamily: "ElMessiri",
          ),
          bodyText2: TextStyle(
              fontSize: 20,
              color:secondaryLightThemeColor,
              fontFamily: "DecoType",
              height: 2
          ),
          headline3: TextStyle(
            color: Colors.white.withOpacity(1),
            fontFamily: "Sultann",
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
      ),

      bottomAppBarTheme: BottomAppBarTheme(
      color: primaryLightThemeColor,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(primaryLightThemeColor),
              minimumSize: MaterialStateProperty.all(Size(150,40)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color:primaryLightThemeColor)
                  )
              )
          )
      )
  );


  static final darkTheme =
  ThemeData(
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: secondaryDarkThemeColor,
          modalBackgroundColor:secondaryDarkThemeColor
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
          color: primaryDarkThemeColor,
          fontSize: 25,
          fontFamily: "ElMessiri",
        ),
        bodyText2: TextStyle(
            fontSize: 20,color:primaryDarkThemeColor,
            fontFamily: "DecoType",
            height: 2
        ),
        headline3: TextStyle(
          color: Colors.black,
          fontFamily: "Sultann",
          fontWeight: FontWeight.normal,
        ),
    ),

    bottomAppBarTheme: BottomAppBarTheme(
    color: secondaryDarkThemeColor,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryDarkThemeColor),
            minimumSize: MaterialStateProperty.all(Size(150,40)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color:primaryDarkThemeColor)
                )
            )
        )
      )
  );

}