import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Loading...',
          style: kPriceTextStyle,
        ),
      ),
    );
  }
}
