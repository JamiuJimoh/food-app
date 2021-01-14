import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meal.dart';
import '../screens/meal_detail_screen.dart';
import '../constants.dart';

class MealItemCard extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final double price;
  // final DateTime timeToPrep;
  // final double ratings;
  final double imageContainerHeight;

  MealItemCard({
    // @required this.id,
    // @required this.title,
    // @required this.imageUrl,
    // @required this.price,
    // @required this.timeToPrep,
    // @required this.ratings,
    this.imageContainerHeight,
  });

  @override
  Widget build(BuildContext context) {
    final meal = Provider.of<Meal>(context, listen: false);

    return Container(
      height: imageContainerHeight,
      width: 200.0,
      child: InkWell(
        onTap: () {
          print(meal.id);
          Navigator.of(context).pushNamed(
            MealDetailScreen.id,
            arguments: meal.id,
          );
        },
        child: Card(
          color: kSecondaryColor,
          elevation: 3.0,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              meal.imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              meal.toggleFavoriteStatus();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: kSecondaryColor,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(7.0),
                              child: Consumer<Meal>(
                                builder: (ctx, meal, child) => Icon(
                                  meal.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 27.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 7.0, horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            meal.title,
                            style: kDescTextStyle,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: kAccentColor2,
                                size: 20.0,
                              ),
                              Text(
                                '${meal.ratings}',
                                style: kSubtitleTextStyle,
                              ),
                            ],
                          ),
                          // Text(
                          //   '$timeToPrep',
                          //   style: kSubtitleTextStyle,
                          // )
                        ],
                      ),
                      Text(
                        '\$${meal.price}',
                        style: kPriceTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
