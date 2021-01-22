import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/meals.dart';
import '../widgets/favorites_list_builder.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context);
    // final favoriteMeals = mealsData.favoriteMeals;

    return Scaffold(
      appBar: AppBar(
        title: Text('favorites'),
      ),
      body: ListView.builder(
        itemCount: mealsData.favoriteMealsListLength,
        itemBuilder: (ctx, i) {
          return Column(
            children: [
              FavoritesListBuilder(index: i),
              const Divider(
                color: kBorderColor,
                thickness: 0.3,
                indent: 15.0,
                endIndent: 15.0,
                height: 20.0,
              )
            ],
          );
        },
      ),
    );
  }
}
