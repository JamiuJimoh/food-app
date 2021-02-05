import 'package:flutter/material.dart';

import 'constants.dart';

class AppTheme {
  AppTheme._();

  static const Color _primaryColor = kScaffoldColor;
  static const Color _iconColor = kAccentColor;
  static const Color _accentColor = kAccentColor;
  static const Color _textColor = kTextColor;

  static final ThemeData primaryAppTheme = ThemeData(
    scaffoldBackgroundColor: _primaryColor,
    appBarTheme: AppBarTheme(
      color: _primaryColor,
      iconTheme: IconThemeData(color: _textColor),
      elevation: 3.5,
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
