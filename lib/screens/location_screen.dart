import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';
import '../providers/user_location.dart';
import '../constants.dart';
import 'map_screen.dart';

class LocationScreen extends StatelessWidget {
  static const id = 'location_screen';

  Future<void> _selectOnMap(BuildContext ctx) async {
    await Navigator.of(ctx).push<LatLng>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(isSelecting: true),
      ),
    );

    // print(selectedLocation.latitude);
  }

  void printLoc(UserLocation locData) {
    locData.userLocations.map((e) => print(e.address.toString())).toList();
  }

  @override
  Widget build(BuildContext context) {
    final locData = Provider.of<UserLocation>(context, listen: false);
    print('=====================');
    printLoc(locData);
    print('=====================');

    return SafeArea(
      child: Scaffold(
        body: LayoutDesign(
          firstColumnFlex: 4,
          firstColumnChild: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LocationBar(
                    onBarTapped: () {},
                    userLocation: Consumer<UserLocation>(
                      builder: (ctx, userLocation, child) => Text(
                        userLocation.initialLocation.address,
                        style: kSubtitleTextStyle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: Consumer<UserLocation>(
                    builder: (ctx, userLocation, child) => ListView.builder(
                      itemCount: userLocation.userLocations.length,
                      itemBuilder: (ctx, i) => ListTile(
                        title: Text(
                            userLocation.userLocations.elementAt(i).address),
                        trailing: Icon(Icons.check),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          secondColumnFlex: 1,
          secondColumnChild: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              child: Text('Select From Map'),
              onPressed: () => _selectOnMap(context),
              style: ElevatedButton.styleFrom(
                primary: kAccentColor3,
                // padding: const EdgeInsets.all(20.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
