import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../constants.dart';
import '../widgets/widgets.dart';

class EditUserMealScreen extends StatefulWidget {
  static const String id = 'edit_product_screen';
  @override
  _EditUserMealScreenState createState() => _EditUserMealScreenState();
}

class _EditUserMealScreenState extends State<EditUserMealScreen> {
  List<Category> _categories;

  List<CategoryCheckTile> _getCheckboxItem() {
    final List<CategoryCheckTile> _checkboxItems = [];

    for (Category category in _categories) {
      var newItem = CategoryCheckTile(
        title: category.title,
      );
      _checkboxItems.add(newItem);
    }

    return _checkboxItems;
  }

  @override
  Widget build(BuildContext context) {
    final _categoriesData = Provider.of<Categories>(context);
    _categories = _categoriesData.categoriesList;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Product',
        ),
      ),
      body: LayoutDesign(
        //custom layout widget
        firstColumnChild: Container(
          child: Text(
            'EDIT MEAL',
            style: kTitleTextStyle,
          ),
        ),
        firstColumnFlex: 1,
        secondColumnFlex: 8,
        secondColumnChild: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    isPasswordInputField: false,
                    label: 'Meal name',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    isPasswordInputField: false,
                    label: 'Meal description',
                    maxLines: 3,
                    textInputType: TextInputType.multiline,
                  ),
                  Row(
                    children: [
                      Expanded(
                        // flex: 1,
                        child: CustomTextField(
                          isPasswordInputField: false,
                          label: 'Price',
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        // flex: 2,
                        child: CustomTextField(
                          isPasswordInputField: false,
                          label: 'Time to prep (minutes)',
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Select the meal categories',
                    style: kDescTextStyle,
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: 200.0,
                    child: ListView(
                      children: [
                        ..._getCheckboxItem(),
                      ],
                    ),
                  ),
                  CustomTextField(
                    isPasswordInputField: false,
                    label: 'Meal name',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
