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
const kBodyTextStyle = TextStyle(
  fontSize: 15.0,
  color: kTextColor,
);
const kSubtitleTextStyle = TextStyle(
  fontSize: 13.0,
  color: kTextColor,
);
const kPriceTextStyle = TextStyle(
  fontSize: 20.0,
  color: kAccentColor,
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

const kScaffoldColor = Color(0xCC111328);
const kSecondaryColor = Color(0xFF1D1E33);
// const kSecondaryColor = Color(0xFF1D1E33);
const kAccentColor = Color(0xFFE55350);
const kAccentColor2 = Color(0xFFFED946);
const kAccentColor3 = Color(0xFFFF975D);
const kTextColor = Color(0xFFE0E0E0);
