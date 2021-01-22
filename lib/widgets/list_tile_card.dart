import 'package:flutter/material.dart';
import 'package:food_delivery/screens/meal_detail_screen.dart';
import 'package:provider/provider.dart';

import '../providers/meal.dart';
import '../constants.dart';

const double listTileCardHeight = 120.0;

class ListTileCard extends StatefulWidget {
  @override
  _ListTileCardState createState() => _ListTileCardState();
}

class _ListTileCardState extends State<ListTileCard> {
  double imgContainerWidth;
  double mealDetailsContainerWidth;

  static const double totalContainersHorizontalPadding = 80.0;
  // total containers horizontal padding (30 + 50 = 80)

  @override
  void didChangeDependencies() {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    imgContainerWidth = mediaQueryWidth * 0.34;
    mealDetailsContainerWidth =
        mediaQueryWidth - imgContainerWidth - totalContainersHorizontalPadding;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final meal = Provider.of<Meal>(context);

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        MealDetailScreen.id,
        arguments: meal.id,
      ),
      // onTap
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        //first horizontal padding (double for both sides is 15 + 15 = 30)
        child: Container(
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
                    topRight: Radius.circular(9.0),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //second horizontal padding (double for both sides is 25 + 25 = 50)
                width: mealDetailsContainerWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        meal.title,
                        style: kDescTextStyle,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.place,
                          size: 18.0,
                        ),
                        const SizedBox(width: 1.5),
                        Container(
                          width: mealDetailsContainerWidth -
                              totalContainersHorizontalPadding,
                          child: Text(
                            meal.location,
                            style: kBodyTextStyle,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      children: [
                        Icon(Icons.my_location, size: 20.0),
                        const SizedBox(width: 5.0),
                        Text(
                          '${meal.distance} km',
                          style: kBodyTextStyle,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
