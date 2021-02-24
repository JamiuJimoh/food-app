import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/user_location.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locData = Provider.of<UserLocation>(context, listen: false);
    locData.fetchandSetUserCurrentLocation();

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
