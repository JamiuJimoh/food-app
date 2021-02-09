import 'package:flutter/material.dart';
import 'package:food_delivery/providers/category.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class CategoryCheckTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Category>(context, listen: false);
    
    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: ListTile(
        tileColor: kSecondaryColor,
        title: Text(
          category.title,
          style: kDescTextStyle,
        ),
        trailing: SizedBox(
          height: 20.0,
          width: 20.0,
          child: Consumer<Category>(
            builder: (ctx, cat, child) => CatCheckbox(
              checkboxState: category.isMealCategory,
              toggleCheckboxState: (_) => category.toggleIsMealCategoryStatus(),
            ),
          ),
        ),
      ),
    );
  }
}

/////////////// CHECKBOX WIDGET //////////////

class CatCheckbox extends StatelessWidget {
  final bool checkboxState;
  final Function(bool) toggleCheckboxState;

  CatCheckbox({
    @required this.checkboxState,
    @required this.toggleCheckboxState,
  });
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}
