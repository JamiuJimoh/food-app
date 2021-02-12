import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Meal with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final double ratings;
  final int reviews;
  final int timeToPrep;
  final Map<String, Object> vendorInfo;
  final double distance;
  final String location;
  List<Category> categories;
  bool isFavorite;

  Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    @required this.timeToPrep,
    @required this.vendorInfo,
    @required this.distance,
    @required this.location,
    this.ratings = 0,
    this.reviews = 0,
    this.isFavorite = false,
  });

  // void set mealCategories(List<Category> categoriesList) {
  //   categories = categoriesList;
  // }

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
