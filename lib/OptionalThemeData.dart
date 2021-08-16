import 'package:flutter/material.dart';

class OptionalThemeData {
  static final darkTheme =ThemeData(
    scaffoldBackgroundColor: Colors.indigo,
    brightness: Brightness.dark,
  );
  static final lightTheme =ThemeData(
    scaffoldBackgroundColor: Colors.white70,
    brightness: Brightness.light,
  );
}