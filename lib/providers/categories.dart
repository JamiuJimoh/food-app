import 'package:flutter/material.dart';

import '../data/categories_data.dart';
import 'category.dart';
import 'meal.dart';

class Categories with ChangeNotifier {
  List<Category> _categoriesList = CategoriesData().categoriesList;

  List<Category> get categoriesList {
    return [..._categoriesList];
  }

  int get catListLength {
    return _categoriesList.length;
  }

  List<Category> get mealCategories {
    return categoriesList.where((category) => category.isMealCategory).toList();
  }

  // void setIsMealCatTrue(Meal meal) {
  //   for (var mealCategoryId in meal.categories) {
  //     findById(mealCategoryId).switchMealCatStatusTrue();
  //   }
  //   notifyListeners();
  // }

  // List<Category> getPickedMealCategories(Meal meal) {
  //   // the meal categories includes the list of category ids for the meal.

  //   // create a new list of categories base on a meal.
  //   // the lists includes all categories list but with a modification.
  //   // modification is that the isMealCat property for each category in the list is set to the either
  //   // true or false depending on categories of the meal.

  //   setIsMealCatTrue(meal);

  //   List<String> _pickedMealCategoryId = [];
  //   List<Category> _pickedMealCategory = [];

  //   for (var category in _categoriesList) {
  //     for (var mealCatId in meal.categories) {
  //       if (category.id != mealCatId &&
  //           !(_pickedMealCategoryId.contains(category.id))) {
  //         // final catData =
  //         //     _categoriesList.firstWhere((cat) => cat.id == category.id);
  //         _pickedMealCategoryId.add(category.id);
  //       }
  //       if (mealCatId != category.id &&
  //           !(_pickedMealCategoryId.contains(mealCatId))) {
  //         // final catData =
  //         //     _categoriesList.firstWhere((cat) => cat.id == mealCatId);
  //         _pickedMealCategoryId.add(mealCatId);
  //       }
  //     }
  //   }
  //   for (var id in _pickedMealCategoryId) {
  //     final catData = findById(id);
  //     _pickedMealCategory.add(catData);
  //   }
  //   print('************************************************');
  //   print('<==> _pickedMealCategory === ${_pickedMealCategory} <==>');
  //   return _pickedMealCategory;
  // }

  List<Meal> selectedCategory(List<Meal> meals, String categoryId) {
    return meals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }

  Category findById(String id) {
    return _categoriesList.firstWhere((cat) => cat.id == id);
  }

  Category findCatMealsById(String catId) {
    return _categoriesList.firstWhere((category) => category.id == catId);
  }

  List<Category> get mealPickedCategory {
    return _categoriesList
        .where((category) => category.isMealCategory)
        .toList();
  }

  List<String> get mealPickedCategoryId {
    return mealPickedCategory.map((item) => item.id).toList();
  }

  toString() {
    return categoriesList.toString();
  }
}
