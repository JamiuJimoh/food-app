import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/categories_list_builder.dart';
import 'package:provider/provider.dart';

import '../providers/categories.dart';
import 'bordered_container.dart';
import 'rounded_category_item.dart';

class CategoriesSection extends StatefulWidget {
  @override
  _CategoriesSectionState createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  double categorySectionHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final mediaQuery = MediaQuery.of(context);
    categorySectionHeight = mediaQuery.size.width * 0.28;
  }

  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<Categories>(context, listen: false);
    // final categories = categoriesData.categoriesList;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: categorySectionHeight,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriesData.catListLength,
              itemBuilder: (ctx, i) {
                return CategoriesListBuilder(
                  index: i,
                  childWidget: BorderedContainer(
                    childWidget: RoundedCatItem(),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
