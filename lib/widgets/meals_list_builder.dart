import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals.dart';
import 'meal_item_card.dart';

class MealsListBuilder extends StatelessWidget {
  final int index;

  const MealsListBuilder({
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context);
    final meals = mealsData.items;
    return ChangeNotifierProvider.value(
      value: meals[index],
      // create: (ctx)=>meals[index],
      child: MealItemCard(
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
