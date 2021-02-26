import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/user_location.dart';

class SplashScreen extends StatelessWidget {
  Future<void> callFetchandSetUserLoc(UserLocation locData) async {
    await locData.fetchandSetUserCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    final locData = Provider.of<UserLocation>(context, listen: false);
    callFetchandSetUserLoc(locData);

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
