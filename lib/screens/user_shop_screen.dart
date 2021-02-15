import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:provider/provider.dart';

import '../widgets/user_meal_item.dart';
import '../providers/meals.dart';
import 'edit_user_meal_screen.dart';

class UserShopScreen extends StatelessWidget {
  static const String id = 'user_products_screen';

  Future<void> _refreshMeals(BuildContext ctx) async {
    await Provider.of<Meals>(ctx, listen: false).fetchAndSetProduct();
  }

  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Meals'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(EditUserMealScreen.id),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshMeals(context),
        child: ListView.builder(
          itemCount: mealsData.mealsListLength,
          itemBuilder: (ctx, i) => Column(
            children: [
              UserMealItem(
                imageUrl: mealsData.items[i].imageUrl,
                title: mealsData.items[i].title,
                id: mealsData.items[i].id,
              ),
              const Divider(
                thickness: 0.3,
                color: kBorderColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
