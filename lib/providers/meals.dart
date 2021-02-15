import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';
import 'meal.dart';

class Meals with ChangeNotifier {
  static const serverUrl = 'https://matlyan-default-rtdb.firebaseio.com/';

  final String authToken;
  Meals(this.authToken, this._mealsList);

  List<Meal> _mealsList = []; //MealsData().loadedMeals;

  List<Meal> get items {
    return [..._mealsList];
  }

  List<Meal> get popularMeals {
    final List<Meal> newMealsList = [..._mealsList];
    //TODO: create an algorithm to calculate popular meals using reviews and ratings.
    newMealsList.sort((a, b) => b.reviews.compareTo(a.reviews));

    return newMealsList;
  }

  List<Meal> get favoriteMeals {
    return _mealsList.where((mealItem) => mealItem.isFavorite).toList();
  }

  int get favoriteMealsListLength {
    return favoriteMeals.length;
  }

  int get mealsListLength {
    return _mealsList.length;
  }

  Meal findById(String id) {
    return _mealsList.firstWhere((meal) => meal.id == id);
  }

  Future<void> fetchAndSetProduct() async {
    final url = '$serverUrl/meals.json?auth=$authToken';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Meal> loadedMeals = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((mealId, mealData) {
        loadedMeals.insert(
          0,
          Meal(
            id: mealId,
            title: mealData['title'],
            description: mealData['description'],
            price: mealData['price'],
            timeToPrep: mealData['timeToPrep'],
            imageUrl: mealData['imageUrl'],
            isFavorite: mealData['isFavorite'],
            distance: mealData['distance'],
            location: mealData['location'],
            vendorInfo: mealData['vendorInfo'],
          ),
        );
      });
      _mealsList = loadedMeals;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addMeal(Meal meal) async {
    const url = '$serverUrl/meals.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': meal.title,
          'description': meal.description,
          'price': meal.price,
          'imageUrl': meal.imageUrl,
          'timeToPrep': meal.timeToPrep,
          'vendorInfo': meal.vendorInfo,
          'distance': meal.distance,
          'location': meal.location,
          'isFavorite': meal.isFavorite
        }),
      );

      final newMeal = Meal(
        id: json.decode(response.body)['name'],
        title: meal.title,
        description: meal.description,
        price: meal.price,
        imageUrl: meal.imageUrl,
        timeToPrep: meal.timeToPrep,
        vendorInfo: meal.vendorInfo,
        distance: meal.distance,
        location: meal.location,
      );
      _mealsList.insert(0, newMeal);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  void removeItem(String mealId) {
    _mealsList.remove(mealId);
    notifyListeners();
  }

  Future<void> updateMeal(String id, Meal newMeal) async {
    final mealIndex = _mealsList.indexWhere((meal) => meal.id == id);
    if (mealIndex >= 0) {
      try {
        final url = '$serverUrl/meals/$id.json';
        await http.patch(url,
            body: json.encode({
              'title': newMeal.title,
              'description': newMeal.description,
              'price': newMeal.price,
              'imageUrl': newMeal.imageUrl,
              'timeToPrep': newMeal.timeToPrep,
              'distance': newMeal.distance,
              'location': newMeal.location,
            }));
        _mealsList[mealIndex] = newMeal;
        notifyListeners();
      } catch (error) {
        throw error;
      }
    } else {
      print('no meal with the given index found');
    }
  }

  Future<void> deleteMeal(String id) async {
    final url = '$serverUrl/meals/$id.json';
    final existingMealIndex = _mealsList.indexWhere((meal) => meal.id == id);
    var existingMeal = _mealsList[existingMealIndex];

    _mealsList.removeAt(existingMealIndex);
    notifyListeners();
    final response = await http.delete(url);

    // the http package only throws it's own error for get/post requests
    // so i have to manually check the status code of the request and use it to
    // throw my own custom error.

    if (response.statusCode >= 400) {
      _mealsList.insert(existingMealIndex, existingMeal);
      notifyListeners();
      throw HttpException('Could not delete meal');
    }
    existingMeal = null;
  }
}
