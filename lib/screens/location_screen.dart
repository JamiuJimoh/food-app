import 'package:flutter/material.dart';
import 'package:food_delivery/models/place.dart';
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
        // fullscreenDialog: true,
        builder: (ctx) => MapScreen(isSelecting: true),
      ),
    );
  }

  void printLoc(UserLocation locData) {
    locData.userLocations.map((e) => print(e.address.toString())).toList();
  }

  @override
  Widget build(BuildContext context) {
    final locData = Provider.of<UserLocation>(context);
    final userLocations = locData.userLocations;
    print('=====================');
    printLoc(locData);
    print('=====================');

    return SafeArea(
      child: Scaffold(
        body: LayoutDesign(
          firstColumnFlex: 4,
          firstColumnChild: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: LocationBar(
                  onBarTapped: () {},
                  userLocation: Text(
                    locData.initialLocation.address,
                    style: kSubtitleTextStyle,
                  ),
                ),
              ),
              const Divider(
                height: 0.5,
                color: kBorderColor,
                thickness: 0.5,
              ),
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Saved Address',
                      style: kTitleTextStyle,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Pick delivery address',
                      style: kDescTextStyle,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: userLocations.length,
                    itemBuilder: (ctx, i) => AddressListCard(
                      address: userLocations.elementAt(i).address,
                      onCardTapped: () => locData.selectUserDeliveryAddress(
                        userLocations.elementAt(i).id,
                      ),
                      isDeliveryAddress:
                          userLocations.elementAt(i).isDeliveryAddress,
                    ),
                  ),
                ),
              ),
            ],
          ),
          secondColumnFlex: 1,
          secondColumnChild: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              child: Text('Select Address From Map'),
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

class AddressListCard extends StatelessWidget {
  final String address;
  final bool isDeliveryAddress;
  final Function onCardTapped;
  const AddressListCard({
    @required this.address,
    @required this.onCardTapped,
    @required this.isDeliveryAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: onCardTapped,
            child: ListTile(
              leading: Icon(
                isDeliveryAddress ? Icons.home : Icons.not_interested,
                color: isDeliveryAddress ? kAccentColor3 : kBorderColor,
              ),
              title: Text(
                address,
                style: kSubtitleTextStyle,
              ),
              trailing: !isDeliveryAddress
                  ? null
                  : Icon(
                      Icons.check,
                      color: kAccentColor3,
                    ),
            ),
          ),
          const Divider(
            height: 0.5,
            color: kBorderColor,
            thickness: 0.5,
            indent: 13.0,
            endIndent: 13.0,
          ),
        ],
      ),
    );
  }
}
