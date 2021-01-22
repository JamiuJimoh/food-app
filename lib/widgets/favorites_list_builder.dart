import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:provider/provider.dart';

import '../providers/meals.dart';
import 'list_tile_card.dart';

class FavoritesListBuilder extends StatelessWidget {
  final int index;

  FavoritesListBuilder({@required this.index});
  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context);
    final favoriteMeals = mealsData.favoriteMeals;
    // final emptyListMessage=favoriteMeals.length==0?
    return favoriteMeals.length == 0
        ? Center(child: Text('You do not have any favorites yet!', style: kDescTextStyle,))
        : ChangeNotifierProvider.value(
            value: favoriteMeals[index],
            child: ListTileCard(),
          );
  }
}
