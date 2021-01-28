import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/providers.dart';
import '../widgets/favorites_list_builder.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  var _isEmpty = false;

  void _toggleIsEmpty(int favMealsListLength) {
    setState(() {
      if (favMealsListLength > 0) {
        _isEmpty = false;
      } else {
        _isEmpty = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context, listen: false);
    // final favoriteMeals = mealsData.favoriteMeals;

    _toggleIsEmpty(mealsData.favoriteMealsListLength);

    print(_isEmpty);
    return Scaffold(
      appBar: AppBar(
        title: Text('favorites'),
      ),
      body: _isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 100.0,
                    // color: kAccentColor,
                    child: Text(
                      'You do not have any favorites yet!',
                      style: kDescTextStyle,
                    ),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: mealsData.favoriteMealsListLength,
              itemBuilder: (ctx, i) {
                return FavoritesListBuilder(
                  index: i,
                  toggleIsEmpty: () =>
                      _toggleIsEmpty(mealsData.favoriteMealsListLength),
                );
              },
            ),
    );
  }
}
