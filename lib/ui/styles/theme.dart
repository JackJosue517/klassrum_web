import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData buildTheme({
    Brightness? brightness,
    VisualDensity? visualDensity,
    TextTheme? textTheme,
    Color? primaryColor,
  }) {
    return ThemeData(
      brightness: brightness,
      visualDensity: visualDensity,
      textTheme: textTheme,
      primaryColor: primaryColor,
    );
  }
}
