import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/meal_detail_screen.dart';
import '../providers/providers.dart';
import 'list_tile_card.dart';

class FavoritesListBuilder extends StatelessWidget {
  final int index;
  final Function toggleIsEmpty;

  FavoritesListBuilder({
    @required this.index,
    @required this.toggleIsEmpty,
  });
  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);

    final favoriteMeals = mealsData.favoriteMeals;
    final favoriteMeal = favoriteMeals[index];

    return ChangeNotifierProvider.value(
      value: favoriteMeal,
      child: Dismissible(
        key: ValueKey(favoriteMeal.id),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Theme.of(context).errorColor,
          child: Icon(
            Icons.clear,
            color: Colors.white,
            size: 30.0,
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20.0),
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        ),
        onDismissed: (direction) {
          favoriteMeals[index].toggleFavoriteStatus(authData.token, authData.userId);
          if (mealsData.favoriteMealsListLength < 1) {
            toggleIsEmpty();
          }
        },
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            MealDetailScreen.id,
            arguments: favoriteMeal.id,
          ),
          child: ListTileCard(),
        ),
      ),
    );
  }
}
