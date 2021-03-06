import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Meal with ChangeNotifier {
  static const serverUrl = 'https://matlyan-default-rtdb.firebaseio.com/';

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
  bool isFavorite;

  Meal({
    @required this.id,
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
  
  void _setFavoriteValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = '$serverUrl/userFavorites/$userId/$id.json?auth=$token';

    try {
      final response = await http.put(
        url,
        body: json.encode(
          isFavorite,
        ),
      );
      if (response.statusCode >= 400) {
        _setFavoriteValue(oldStatus);
      }
    } catch (error) {
      _setFavoriteValue(oldStatus);

      throw error;
    }
  }
}
