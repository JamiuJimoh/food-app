import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:provider/provider.dart';

import '../widgets/user_product_item.dart';
import '../providers/meals.dart';

class UserProductsScreen extends StatelessWidget {
  static const String id = 'user_products_screen';
  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Meals'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: mealsData.mealsListLength,
        itemBuilder: (ctx, i) => Column(
          children: [
            UserProductItem(
              imageUrl: mealsData.items[i].imageUrl,
              title: mealsData.items[i].title,
            ),
            const Divider(
              thickness: 0.3,
              color: kBorderColor,
            ),
          ],
        ),
      ),
    );
  }
}
