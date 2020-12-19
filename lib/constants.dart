import 'package:flutter/material.dart';

const kTitleTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
const kDescTextStyle = TextStyle(
  fontSize: 20.0,
  color: kTextColor,
);
const kOnboardButtonTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.white,
  fontWeight: FontWeight.w200,
);

const kOnboardImageGradient = LinearGradient(
  colors: [kScaffoldColor, Color(0x00111328)],
  begin: Alignment.bottomCenter,
  end: Alignment.center,
);

const kOnboardBottomButtonGradient = LinearGradient(
  colors: [kAccentColor2, kAccentColor],
  begin: Alignment.bottomLeft,
  end: Alignment.bottomRight,
);

const kScaffoldColor = Color(0xFF111328);
const kAccentColor = Color(0xFFE55350);
const kAccentColor2 = Color(0xFFFED946);
const kTextColor = Color(0xFFE0E0E0);
