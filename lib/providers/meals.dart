import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';

import 'meal.dart';

class Meals with ChangeNotifier {
  List<Meal> _mealsList = MealsData().loadedMeals;

  // var _showFavoritesOnly = false;

  List<Meal> get items {
    // if (_showFavoritesOnly) {
    //   return _mealsList.where((mealItem) => mealItem.isFavorite).toList();
    // }
    return [..._mealsList];
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  int get mealsListLength {
    return _mealsList.length;
  }

  Meal findById(String id) {
    return _mealsList.firstWhere((meal) => meal.id == id);
  }

  void addProduct() {
    // _mealsList.add();
    notifyListeners();
  }
}
