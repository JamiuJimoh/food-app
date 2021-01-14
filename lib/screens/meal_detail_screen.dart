import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals.dart';

class MealDetailScreen extends StatelessWidget {
  static const String id = 'meal_detail_screen';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    // gives the id from tapped meal-item-card.

    final loadedMeal = Provider.of<Meals>(context, listen: false).findById(mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedMeal.title),
      ),
    );
  }
}
