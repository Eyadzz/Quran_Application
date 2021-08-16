import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier
{
  ThemeMode themeMode = ThemeMode.light;
  void setTheme(){
    themeMode = ThemeMode.light;
    notifyListeners();
  }
  void setDarkTheme(){
    themeMode = ThemeMode.dark;
    notifyListeners();
  }
  bool isDarkTheme()
  {
    return themeMode == ThemeMode.dark;
  }
}