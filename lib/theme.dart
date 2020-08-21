import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
      primarySwatch: kPrimaryColor,
      accentColor: kAccentColor,
      backgroundColor: kBackgroundColor,
      accentColorBrightness: Brightness.dark,
      appBarTheme:
          Theme.of(context).appBarTheme.copyWith(brightness: Brightness.light),
      buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.pink,
          textTheme: ButtonTextTheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))));
}
