import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';

import 'categories.dart';
import 'category.dart';
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

  // void setMealPickedCat(List<Category> categories, List<String> pickedMealCatId, String mealId) {
  //   for(var meal in _mealsList){
  //     if(meal.id==mealId){

  //     for(var category in categories){
  //       // category.id==meal.categories
  //     }
  //     }
  //   }
  // }

  // void setPickedMealCat(List<String> pickedMealCategoryIds, Categories categories) {
  //   for(var mealCategoryId in pickedMealCategoryIds){
  //     categories.findById(mealCategoryId).switchMealCatStatusTrue();
  //   }
  // }

  // void setIsMealCatTrue(String mealId, Categories categories) {
  //   final meal=_mealsList.firstWhere((meal) => meal.id == mealId);
  //   for (var mealCategoryId in meal.categories) {
  //     categories.findById(mealCategoryId).switchMealCatStatusTrue();
  //   }
  //   notifyListeners();
  // }

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

  void addMeal(Meal meal) {
    final newMeal = Meal(
      id: DateTime.now().toString(),
      categories: meal.categories,
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
