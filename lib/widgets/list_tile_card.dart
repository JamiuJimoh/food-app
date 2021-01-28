import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/meal_detail_screen.dart';
import '../providers/meal.dart';
import '../constants.dart';

const double _listTileCardHeight = 100.0;

class ListTileCard extends StatefulWidget {
  @override
  _ListTileCardState createState() => _ListTileCardState();
}

class _ListTileCardState extends State<ListTileCard> {
  double _imgContainerWidth;
  double _mealDetailsContainerWidth;

  static const double _totalContainersHorizontalPadding = 80.0;
  // total containers horizontal padding (30 + 50 = 80)

  @override
  void didChangeDependencies() {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    _imgContainerWidth = mediaQueryWidth * 0.30;
    _mealDetailsContainerWidth = mediaQueryWidth -
        _imgContainerWidth -
        _totalContainersHorizontalPadding;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final meal = Provider.of<Meal>(context, listen: false);

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        MealDetailScreen.id,
        arguments: meal.id,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
        //first horizontal padding (double for both sides is 15 + 15 = 30)
        child: Column(
          children: [
            Container(
              height: _listTileCardHeight,
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    width: _imgContainerWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          meal.imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //second horizontal padding (double for both sides is 25 + 25 = 50)
                    width: _mealDetailsContainerWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              meal.title,
                              style: kDescTextStyle,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 3.0),
                            Row(
                              children: [
                                Icon(Icons.timer, size: 20.0),
                                const SizedBox(width: 5.0),
                                Text(
                                  '${meal.timeToPrep} mins',
                                  style: kBodyTextStyle,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
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
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Divider(
              color: kBorderColor,
              thickness: 0.3,
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
