import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier
{
  String currentLocale = 'ar';
  ThemeMode themeMode = ThemeMode.light;

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