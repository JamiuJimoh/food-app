import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/rounded_category_item.dart';
import 'package:food_delivery/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/categories.dart';

class CategoriesListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<Categories>(context);
    final categories = categoriesData.categoriesList;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categoriesData.catListLength,
      itemBuilder: (ctx, i) {
        return ChangeNotifierProvider.value(
          value: categories[i],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: BorderedContainer(
              childWidget: RoundedCatItem(),
            ),
          ),
        );
      },
    );
  }
}
