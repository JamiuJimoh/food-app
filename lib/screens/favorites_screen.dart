import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../widgets/list_tile_card.dart';
import '../providers/meals.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('favorites'),
      ),
      body: ListView.builder(
        itemCount: mealsData.favoriteMealsListLength,
        itemBuilder: (ctx, i) {
          return FavoritesListBuilder(index: i);
        },
      ),
    );
  }
}
