import 'package:flutter/material.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
      primarySwatch: Colors.pink,
      accentColor: Colors.pink,
      backgroundColor: Colors.pink,
      accentColorBrightness: Brightness.dark,
      appBarTheme:
          Theme.of(context).appBarTheme.copyWith(brightness: Brightness.light),
      buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.pink,
          textTheme: ButtonTextTheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))));
}
