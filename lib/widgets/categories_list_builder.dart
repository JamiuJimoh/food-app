import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/categories.dart';

class CategoriesListBuilder extends StatelessWidget {
  final int index;
  final Widget childWidget;

  CategoriesListBuilder({
    @required this.index,
    @required this.childWidget,
  });
  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<Categories>(context, listen: false);
    final categories = categoriesData.categoriesList;

    return ChangeNotifierProvider.value(
      value: categories[index],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: childWidget,
      ),
    );
  }
}
