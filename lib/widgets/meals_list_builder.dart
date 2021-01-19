import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals.dart';
import 'meal_item_card.dart';

class MealsListBuilder extends StatelessWidget {
  final int index;
  final bool isPopular;

  const MealsListBuilder({
    @required this.index,
    @required this.isPopular,
  });

  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context);
    final meals = isPopular ? mealsData.popularMeals : mealsData.items;
    return ChangeNotifierProvider.value(
      value: meals[index],
      // create: (ctx)=>meals[index],
      child: MealItemCard(
        isPopular: isPopular,
        imageContainerHeight: 250.0,
        // id: meals[index].id,
        // imageUrl: meals[index].imageUrl,
        // price: meals[index].price,
        // title: meals[index].title,
        // timeToPrep: meals[index].timeToPrep,
        // ratings: meals[index].ratings,
      ),
    );
  }
}
