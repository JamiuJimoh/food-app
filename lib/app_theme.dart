import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static Color _primaryColor = Color(0xFF111328);
  static Color _textColor = Color(0xFFE0E0E0);

  static final ThemeData primaryAppTheme = ThemeData(
    scaffoldBackgroundColor: _primaryColor,
    appBarTheme: AppBarTheme(
      color: _primaryColor,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: _textColor),
    ),
    fontFamily: 'Poppins',
  );
}
