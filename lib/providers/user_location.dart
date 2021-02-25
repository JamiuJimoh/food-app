import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/helpers/location_helper.dart';
import 'package:food_delivery/models/models.dart';
import 'package:location/location.dart';

class UserLocation with ChangeNotifier {
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  // LocationData _locationData;

  Set<PlaceLocation> _userLocations = {};

  Set<PlaceLocation> get userLocations {
    return {..._userLocations};
  }

  Future<void> fetchandSetUserCurrentLocation() async {
    try {
      Location location = Location();
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return;
        }
      }

      final locData = await location.getLocation();
      String _address = await LocationHelper.getPlaceAddress(
        locData.latitude,
        locData.longitude,
      );
      final userLocation = PlaceLocation(
        latitude: locData.latitude,
        longitude: locData.longitude,
        address: _address,
      );

      _userLocations.add(userLocation);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }


  Future<void> addLocation(lat, lng) async {
    String _address = await LocationHelper.getPlaceAddress(
      lat,
      lng,
    );
    final addedLocation = PlaceLocation(
      latitude: lat,
      longitude: lng,
      address: _address,
    );
    _userLocations.add(addedLocation);
    notifyListeners();
  }

  PermissionStatus get permissionStatus {
    return _permissionGranted;
  }

  PlaceLocation get initialLocation {
    if (!userLocations.isEmpty && userLocations != null) {
      return _userLocations.first;
    }
    return null;
  }
}
