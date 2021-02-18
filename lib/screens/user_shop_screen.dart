import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../mixins/appbar_mixin.dart';
import '../constants.dart';
import '../widgets/user_meal_item.dart';
import '../providers/meals.dart';
import 'edit_user_meal_screen.dart';

class UserShopScreen extends StatelessWidget with AppBarMixin {
  static const String id = 'user_products_screen';

  Future<void> _refreshMeals(BuildContext ctx) async {
    await Provider.of<Meals>(ctx, listen: false).fetchAndSetProduct(true);
  }

  @override
  Widget build(BuildContext context) {
    // final mealsData = Provider.of<Meals>(context);
    print('rebuilding...');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Meals'),
          bottom: bottomBorder(),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () =>
                  Navigator.of(context).pushNamed(EditUserMealScreen.id),
            ),
          ],
        ),
        body: FutureBuilder(
          future: _refreshMeals(context),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: () => _refreshMeals(context),
                      child: Consumer<Meals>(
                        builder: (ctx, mealsData, _) => Padding(
                          padding: const EdgeInsets.only(top: 8.0),
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
                      ),
                    ),
        ),
      ),
    );
  }
}
