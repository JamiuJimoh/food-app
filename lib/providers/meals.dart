import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';

import 'meal.dart';

class Meals with ChangeNotifier {
  List<Meal> _mealsList = MealsData().loadedMeals;

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

  void addProduct() {
    // _mealsList.add();
    notifyListeners();
  }

  void removeItem(String mealId) {
    _mealsList.remove(mealId);
    notifyListeners();
  }
}
