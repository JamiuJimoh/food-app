import 'package:flutter/material.dart';

import '../data/categories_data.dart';
import '../widgets/widgets.dart';

class MealsOverviewScreen extends StatelessWidget {
  static const String id = 'meals_overview_screen';

  final CategoriesData categoriesData = CategoriesData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home-cooked Meals'),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Home-cooked Meals',
            ),
            centerTitle: false,
            floating: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/fruits3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 120.0,
                // color: Colors.red,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesData.catListLength,
                  itemBuilder: (ctx, i) {
                    return RoundedCatItem(
                      title: categoriesData.categoriesList[i].title,
                      imageUrl: categoriesData.categoriesList[i].imageUrl,
                    );
                  },
                ),
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
