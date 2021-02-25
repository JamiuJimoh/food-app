import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../screens/location_screen.dart';
import '../models/models.dart';
import '../providers/user_location.dart';
import '../constants.dart';
import 'location_bar.dart';

class LocationInput extends StatelessWidget {
  PlaceLocation getInitialLocation(UserLocation locData) {
    if (locData.permissionStatus == PermissionStatus.granted) {

      return locData.initialLocation;
    } else {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final locData = Provider.of<UserLocation>(context, listen: false);
    getInitialLocation(locData);
    PlaceLocation userLocation = locData.initialLocation;

    return userLocation == null
        ? Center(child: CircularProgressIndicator())
        : LocationBar(
            onBarTapped: () =>
                Navigator.of(context).pushNamed(LocationScreen.id),
            userLocation: Text(
              userLocation.address,
              style: kSubtitleTextStyle,
            ),
          );
  }
}
