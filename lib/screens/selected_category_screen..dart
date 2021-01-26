import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/providers/categories.dart';
import 'package:food_delivery/providers/meals.dart';
import 'package:provider/provider.dart';

class SelectedCategoryScreen extends StatelessWidget {
  static const String id = 'selected_categories_screen';

  @override
  Widget build(BuildContext context) {
    final categoryId = ModalRoute.of(context).settings.arguments as String;
    final categoriesData = Provider.of<Categories>(context);
    final category = categoriesData.findById(categoryId);
    final mealsData = Provider.of<Meals>(context);
    final meals = mealsData.items;
    final selectedCategory = categoriesData.selectedCategory(meals, categoryId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${category.title}'),
      ),
      body: ListView.builder(
        itemCount: selectedCategory.length,
        itemBuilder: (ctx, i) {
          return Text(
            selectedCategory[i].title,
            // selectedCategory[i].timeToPrep.toString(),
            style: kDescTextStyle,
          );
        },
      ),
    );
  }
}
