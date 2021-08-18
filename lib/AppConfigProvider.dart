import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier
{
  late ThemeMode themeMode = ThemeMode.light;

  Future<void> checkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool('lightTheme')?? true){
      themeMode = ThemeMode.light;
    }else{
      themeMode = ThemeMode.dark;
    }
  }

  AppConfigProvider(){
    checkTheme();
  }

  String currentLocale = 'ar';


  void setTheme()
  {
    themeMode = ThemeMode.light;
    notifyListeners();
  }

  void setDarkTheme()
  {
    themeMode = ThemeMode.dark;
    notifyListeners();
  }

  bool isDarkTheme()
  {
    return themeMode == ThemeMode.dark;
  }

  void changeLanguage(String lang)
  {
    if(currentLocale == lang)
      return;
    currentLocale = lang;
    notifyListeners();
  }

}