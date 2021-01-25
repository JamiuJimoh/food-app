import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals.dart';
import 'list_tile_card.dart';

class FavoritesListBuilder extends StatelessWidget {
  final int index;

  FavoritesListBuilder({@required this.index});
  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context, listen: false);
    final favoriteMeals = mealsData.favoriteMeals;
    // final emptyListMessage=favoriteMeals.length==0?
    // print(favoriteMeals == null ? "null" : "not null");
    return ChangeNotifierProvider.value(
      value: favoriteMeals[index],
      child: Dismissible(
        key: ValueKey(favoriteMeals[index].id),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Theme.of(context).errorColor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40.0,
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20.0),
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        ),
        onDismissed: (direction) {
          favoriteMeals[index].toggleFavoriteStatus();
        },
        child: ListTileCard(),
      ),
    );
  }
}
