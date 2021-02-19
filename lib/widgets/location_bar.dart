import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';

class LocationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(right: 65.0),
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      width: double.infinity,
      height: 30.0,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
      ),
      child: Row(
        children: [
          Flexible(
            // flex: 2,
            fit: FlexFit.tight,
            child: Text(
              'Maryland',
              style: kSubtitleTextStyle,
            ),
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
    );
  }
}
