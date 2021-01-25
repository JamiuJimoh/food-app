import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/providers.dart';
import '../widgets/favorites_list_builder.dart';

class FavoritesScreen extends StatelessWidget {
  Widget _favListDisplay(int index, int favListLength, List<Meal> favList) {
    if (favListLength == 0 && favList == null) {
      print('container nill');
      return Container(
        height: 100.0,
        color: kAccentColor,
        child: Text(
          'You do not have any favorites yet!',
          style: kDescTextStyle,
        ),
      );
    } else {
      return FavoritesListBuilder(index: index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context, listen: false);
    final favoriteMeals = mealsData.favoriteMeals;

    print(mealsData.favoriteMealsListLength);
    return Scaffold(
      appBar: AppBar(
        title: Text('favorites'),
      ),
      body: ListView.builder(
        itemCount: mealsData.favoriteMealsListLength,
        itemBuilder: (ctx, i) {
          return _favListDisplay(
              i, mealsData.favoriteMealsListLength, favoriteMeals);
        },
      ),
    );
  }
}
