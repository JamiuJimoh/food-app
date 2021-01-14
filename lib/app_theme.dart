import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _primaryColor = Color(0xFF111328);
  static const Color _secondaryColor = Color(0xFF1D1E33);
  static const Color _iconColor = Color(0xFFE55350);
  static const Color _accentColor = Color(0xFFFED946);
  static const Color _textColor = Color(0xFFE0E0E0);

  static final ThemeData primaryAppTheme = ThemeData(
    scaffoldBackgroundColor: _primaryColor,
    appBarTheme: AppBarTheme(
      color: _secondaryColor,
      iconTheme: IconThemeData(color: _textColor),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: _textColor),
    ),
    fontFamily: 'Poppins',
    iconTheme: IconThemeData(color: _iconColor),
  );
}
