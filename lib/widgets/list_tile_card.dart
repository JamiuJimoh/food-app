import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/providers/meal.dart';
import 'package:provider/provider.dart';

import '../providers/meals.dart';
import 'bordered_container.dart';

const double listTileCardHeight = 100.0;

class ListTileCard extends StatefulWidget {
  @override
  _ListTileCardState createState() => _ListTileCardState();
}

class _ListTileCardState extends State<ListTileCard> {
  double imgContainerWidth;

  @override
  void didChangeDependencies() {
    final mediaQuery = MediaQuery.of(context);
    imgContainerWidth = mediaQuery.size.width * 0.28;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final meal = Provider.of<Meal>(context);
    // final favoriteMeals = mealsData.favoriteMeals;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BorderedContainer(
        childWidget: Container(
          height: listTileCardHeight,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                width: imgContainerWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      meal.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(9.0),
                    bottomLeft: Radius.circular(9.0),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    meal.title,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
