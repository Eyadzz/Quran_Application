
import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{

  String currentLocale = 'ar';

  void changeLanguage(String lang){
    if(currentLocale == lang)
      return;
    currentLocale = lang;
    notifyListeners();
  }
}