import 'package:flutter/material.dart';

import '../constants.dart';

class LocationBar extends StatelessWidget {
  final Function onBarTapped;
  final Widget userLocation;

  LocationBar({
    @required this.onBarTapped,
    @required this.userLocation,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBarTapped,
      // onTap: () => getUserCurrentLocation(context),
      child: Container(
        // margin: const EdgeInsets.only(right: 65.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        width: double.infinity,
        height: 38.0,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: kBorderColor, width: 1.0),
        ),
        child: Row(
          children: [
            Flexible(
              // flex: 2,
              fit: FlexFit.tight,
              child: userLocation,
            ),
            // Spacer(),
            VerticalDivider(
              color: kBorderColor,
            ),
            Icon(
              Icons.location_pin,
              size: 19.0,
            ),
          ],
        ),
      ),
    );
  }
}
