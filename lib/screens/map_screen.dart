import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../helpers/location_helper.dart';
import '../providers/user_location.dart';
import '../widgets/location_bar.dart';

class MapScreen extends StatefulWidget {
  static const id = 'map_screen';
  final bool isSelecting;

  MapScreen({
    this.isSelecting = false,
  });
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation;
  String _address;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
      getPickedAddress(position);
    });
  }

  Future<void> getPickedAddress(LatLng position) async {
    final newAddress = await LocationHelper.getPlaceAddress(
      position.latitude,
      position.longitude,
    );
    setState(() {
      _address = newAddress;
    });
  }

  Future<void> addPickedLocation(UserLocation locData) async {
    print('_pickedLocation.latitude');
    print(_pickedLocation.latitude);
    print('_pickedLocation.longitude');
    print(_pickedLocation.longitude);
    await locData.addLocation(
        _pickedLocation.latitude, _pickedLocation.longitude);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final locData = Provider.of<UserLocation>(context, listen: false);
    final initialLocation = locData.initialLocation;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            if (widget.isSelecting && _pickedLocation != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: _pickedLocation == null
                      ? null
                      : () => addPickedLocation(locData),
                  child: Icon(
                    Icons.check,
                    size: 30.0,
                  ),
                ),
              ),
          ],
          title: LocationBar(
            onBarTapped: null,
            userLocation: Text(
              initialLocation == null
                  ? 'Getting address...'
                  : (_address ?? initialLocation.address),
              style: kSubtitleTextStyle,
            ),
          ),
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
              initialLocation.latitude,
              initialLocation.longitude,
            ),
            zoom: 16,
          ),
          onTap: widget.isSelecting ? _selectLocation : null,
          markers: _pickedLocation == null
              ? {
                  Marker(
                    markerId: MarkerId('initialMarker'),
                    position: LatLng(
                      initialLocation.latitude,
                      initialLocation.longitude,
                    ),
                  ),
                }
              : {
                  Marker(
                    draggable: true,
                    markerId: MarkerId('pickedMarker1'),
                    position: _pickedLocation,
                  ),
                },
        ),
      ),
    );
  }
}
