import 'package:flutter/foundation.dart';

class PlaceLocation {
  final String id;
  final double latitude;
  final double longitude;
  final String address;
  bool isDeliveryAddress;

  PlaceLocation({
    @required this.id,
    @required this.latitude,
    @required this.longitude,
    @required this.address,
    this.isDeliveryAddress = false,
  });
}

// class Place {
//   final String id;
//   final String title;
//   final PlaceLocation location;

//   Place({
//     this.id,
//     this.title,
//     this.location,
//   });
// }
