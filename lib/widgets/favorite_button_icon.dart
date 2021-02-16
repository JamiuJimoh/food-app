import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class FavoriteButtonIcon extends StatelessWidget {
  final Meal meal;
  FavoriteButtonIcon({this.meal});

  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<Auth>(context, listen: false);

    return Consumer<Meal>(
      builder: (ctx, _, child) => IconButton(
        icon: Icon(meal.isFavorite ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          meal.toggleFavoriteStatus(authData.token, authData.userId);
        },
      ),
    );
  }
}
