import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';
import '../providers/providers.dart';
import '../screens/meal_detail_screen.dart';
import '../constants.dart';

class MealItemCard extends StatelessWidget {
  final bool isPopular;
  final double imageContainerHeight;

  MealItemCard({
    @required this.isPopular,
    this.imageContainerHeight,
  });

  @override
  Widget build(BuildContext context) {
    final meal = Provider.of<Meal>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);

    return BorderedContainer(
      childWidget: Container(
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
          child: Column(
            children: [
              Flexible(
                flex: 6,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Hero(
                        tag: isPopular ? 'popular${meal.id}' : meal.id,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(meal.imageUrl),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(9.0),
                              topRight: Radius.circular(9.0),
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
                              onPressed: () {
                                meal.toggleFavoriteStatus(authData.token);
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
                flex: 3,
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 190.0,
                            child: Text(
                              meal.title,
                              style: kDescTextStyle,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: kAccentColor2,
                                size: 18.0,
                              ),
                              SizedBox(width: 2.0),
                              Text(
                                '${meal.ratings}',
                                style: kSubtitleTextStyle,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(width: 15.0),
                              Icon(Icons.timer, size: 18.0),
                              const SizedBox(width: 5.0),
                              Text(
                                '${meal.timeToPrep} mins',
                                style: kSubtitleTextStyle,
                              ),
                            ],
                          ),
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
