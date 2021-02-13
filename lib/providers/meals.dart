import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/data.dart';
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

  Future<void> addMeal(Meal meal) async {
    const url = 'https://matlyan-default-rtdb.firebaseio.com/meals.json';
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

  void updateMeal(String id, Meal newMeal) {
    final mealIndex = _mealsList.indexWhere((meal) => meal.id == id);
    if (mealIndex >= 0) {
      _mealsList[mealIndex] = newMeal;
      notifyListeners();
    } else {
      print('no meal with the given index found');
    }
  }

  void deleteMeal(String id) {
    _mealsList.removeWhere((meal) => meal.id == id);
    notifyListeners();
  }
}
