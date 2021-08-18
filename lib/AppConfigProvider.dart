import 'package:flutter/material.dart';
import 'Preferences.dart';

class AppConfigProvider extends ChangeNotifier
{
  late ThemeMode themeMode = ThemeMode.light;
  String currentLocale = 'ar';

  void changeToLightTheme()
  {
    themeMode = ThemeMode.light;
    Preferences.saveThemePreference(themeMode);
    notifyListeners();
  }

  void changeToDarkTheme()
  {
    themeMode = ThemeMode.dark;
    Preferences.saveThemePreference(themeMode);
    notifyListeners();
  }

  bool isDarkTheme()
  {
    return themeMode == ThemeMode.dark;
  }

  void changeLanguage(String lang)
  {
    currentLocale = lang;
    Preferences.setLanguage(currentLocale);
    notifyListeners();
  }

}