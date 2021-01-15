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

  List<Meal> selectedCategory(List<Meal> meals, String categoryId) {
    return meals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }

  Category findById(String catId) {
    return _categoriesList.firstWhere((category) => category.id == catId);
  }
}
