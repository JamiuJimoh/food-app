import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Meal with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final double ratings;
  final DateTime timeToPrep;
  final Map<String, Object> vendorInfo;
  bool isFavorite;

  Meal({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    @required this.ratings,
    @required this.timeToPrep,
    @required this.vendorInfo,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
