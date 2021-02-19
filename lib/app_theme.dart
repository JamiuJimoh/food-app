import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

class AppTheme {
  AppTheme._();

  static const Color _primaryColor = kScaffoldColor;
  static const Color _iconColor = kAccentColor;
  static const Color _accentColor = kAccentColor;
  static const Color _textColor = kTextColor;

  static final ThemeData primaryAppTheme = ThemeData(
    scaffoldBackgroundColor: _primaryColor,
    // accentColorBrightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: _primaryColor,
      iconTheme: IconThemeData(color: _iconColor),
    ),
    unselectedWidgetColor: kAccentColor,
    accentColor: _accentColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: _textColor),
    ),
    fontFamily: 'Poppins',
    iconTheme: IconThemeData(color: _iconColor),
  );
}
