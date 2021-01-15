import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/meals.dart';
import '../data/categories_data.dart';
import '../widgets/widgets.dart';

class MealsOverviewScreen extends StatelessWidget {
  static const String id = 'meals_overview_screen';

  final CategoriesData categoriesData = CategoriesData();

  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context, listen: false);
    print('meal rebuilds');
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Meals',
            ),
            centerTitle: false,
            floating: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/banner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 90.0,
                child: CategoriesListBuilder(),
              ),
            ),
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
                        return MealsListBuilder(index: i);
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
                    child: MealsListBuilder(index: i),
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

//  ListView.builder(
//   padding: const EdgeInsets.all(10.0),
//   itemCount: loadedMeals.length,
//   itemBuilder: (ctx, i) => MealItemCard(
//     imageUrl: loadedMeals[i].imageUrl,
//   ),
// ),
