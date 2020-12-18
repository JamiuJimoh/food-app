import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static Color _primaryColor = Color(0XFF32004A);
  static Color _textColor = Color(0XFF000000);

  static final ThemeData primaryAppTheme = ThemeData(
    scaffoldBackgroundColor: _primaryColor,
    appBarTheme: AppBarTheme(
      color: _primaryColor,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: _textColor),
    ),
  );
}
