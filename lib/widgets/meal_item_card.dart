import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meal.dart';
import '../screens/meal_detail_screen.dart';
import '../constants.dart';
import 'rounded_icon_button.dart';

class MealItemCard extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final double price;
  // final DateTime timeToPrep;
  // final double ratings;
  bool isPopular;
  final double imageContainerHeight;

  MealItemCard({
    // @required this.id,
    // @required this.title,
    // @required this.imageUrl,
    // @required this.price,
    // @required this.timeToPrep,
    // @required this.ratings,
    @required this.isPopular,
    this.imageContainerHeight,
  });

  @override
  Widget build(BuildContext context) {
    final meal = Provider.of<Meal>(context, listen: false);

    return Container(
      height: imageContainerHeight,
      width: 300.0,
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
              Flexible(
                flex: 4,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Hero(
                        tag: isPopular? 'popular${meal.id}':meal.id,
                        child: Container(
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
                      ),
                      Positioned(
                        right: 0,
                        child: RoundedIconButton(
                          childWidget: Consumer<Meal>(
                            builder: (ctx, meal, child) => IconButton(
                              icon: Icon(meal.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border),
                              // size: 27.0,
                              onPressed: () {
                                meal.toggleFavoriteStatus();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
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
