import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../widgets/widgets.dart';
import '../providers/providers.dart';

class MealDetailScreen extends StatefulWidget {
  static const String id = 'meal_detail_screen';

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  double _expandedHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final mediaQuery = MediaQuery.of(context);
    _expandedHeight = mediaQuery.size.height * 0.45;
  }

  Widget _buildSliverHead(Meal loadedMeal) {
    return SliverPersistentHeader(
      floating: true,
      delegate: ImageSliverHeaderDelegate(
        expandedHeight: _expandedHeight,
        loadedMeal: loadedMeal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    // gives the id from tapped meal-item-card.

    final loadedMeal =
        Provider.of<Meals>(context, listen: false).findById(mealId);

    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverHead(loadedMeal),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 10.0,
                right: 15.0,
                left: 15.0,
                bottom: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loadedMeal.title,
                    style: kTitleTextStyle,
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 18.0,
                            color: kAccentColor2,
                          ),
                          const SizedBox(width: 1.5),
                          Text('${loadedMeal.ratings}', style: kBodyTextStyle),
                          const SizedBox(width: 5.0),
                          Text(
                            '(${loadedMeal.reviews} reviews)',
                            style: kBodyTextStyle,
                          ),
                        ],
                      ),
                      Text(
                        '\$${loadedMeal.price}',
                        style: kPriceTextStyle.copyWith(fontSize: 25.0),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Icon(
                        Icons.place,
                        size: 18.0,
                      ),
                      const SizedBox(width: 1.5),
                      Text(
                        loadedMeal.location,
                        style: kBodyTextStyle,
                      ),
                      const SizedBox(width: 10.0),
                      Icon(Icons.my_location, size: 20.0),
                      const SizedBox(width: 5.0),
                      Text(
                        '${loadedMeal.distance} km',
                        style: kBodyTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text(
                        'Delivery time',
                        style: kBodyTextStyle,
                      ),
                      const SizedBox(width: 10.0),
                      Icon(Icons.timer, size: 20.0),
                      const SizedBox(width: 5.0),
                      Text(
                        '${loadedMeal.timeToPrep} mins',
                        style: kBodyTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    loadedMeal.description,
                    style: kDescTextStyle,
                  ),
                  const SizedBox(height: 60.0),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: GradientButton(
        isCurved: false,
        context: context,
        label: 'ADD TO CART',
        onTap: () => cart.addItem(
          loadedMeal.id,
          loadedMeal.price,
          loadedMeal.title,
        ),
      ),
    );
  }
}
