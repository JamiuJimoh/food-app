import 'package:flutter/material.dart';
import 'package:food_delivery/providers/meal.dart';
import 'package:provider/provider.dart';

class FavoriteButtonIcon extends StatelessWidget {
  final Meal meal;
  FavoriteButtonIcon({this.meal});

  @override
  Widget build(BuildContext context) {
    return Consumer<Meal>(
      builder: (ctx, _, child) => IconButton(
        icon: Icon(meal.isFavorite ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          meal.toggleFavoriteStatus();
        },
      ),
    );
  }
}
