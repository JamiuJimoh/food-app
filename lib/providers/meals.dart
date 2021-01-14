import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';

import 'meal.dart';

class Meals with ChangeNotifier {
  List<Meal> _mealsList = MealsData().loadedMeals;

  List<Meal> get items {
    return [..._mealsList];
  }

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
