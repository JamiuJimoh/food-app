import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Meal with ChangeNotifier {
  final String id;
  final List<String> categories;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final double ratings;
  final int reviews;
  final int timeToPrep;
  final Map<String, Object> vendorInfo;
  bool isFavorite;

  Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    @required this.ratings,
    @required this.reviews,
    @required this.timeToPrep,
    @required this.vendorInfo,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
