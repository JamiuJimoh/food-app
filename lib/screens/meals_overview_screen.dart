import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';
import 'cart_screen.dart';

class MealsOverviewScreen extends StatelessWidget {
  static const String id = 'meals_overview_screen';

  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context, listen: false);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Meals',
            ),
            centerTitle: false,
            floating: true,
            // pinned: true,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Consumer<Cart>(
                  builder: (_, cart, ch) => Badge(
                    value: cart.itemCount.toString(),
                    child: ch,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.id);
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: kTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      'Popular',
                      style: kDescTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 200.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mealsData.mealsListLength,
                      itemBuilder: (ctx, i) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: MealsListBuilder(index: i, isPopular: true),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 18.0,
              left: 18.0,
              right: 18.0,
            ),
            sliver: SliverToBoxAdapter(
              child: Text('Featured', style: kDescTextStyle),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(18.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (ctx, i) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: MealsListBuilder(index: i, isPopular: false),
                  );
                },
                childCount: mealsData.mealsListLength,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
