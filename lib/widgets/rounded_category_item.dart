import 'package:flutter/material.dart';
import 'package:food_delivery/screens/category_meals_screen.dart';
import 'package:provider/provider.dart';

import '../providers/category.dart';
import '../constants.dart';

const containerHeight = 20.0;

class RoundedCatItem extends StatelessWidget {
  // final String title;
  // final String imageUrl;

  // RoundedCatItem({
  //   @required this.title,
  //   @required this.imageUrl,
  // });

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Category>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19.0),
      child: GestureDetector(
        onTap: () {
          print('${category.id}');
          Navigator.of(context).pushNamed(
            CategoryMealsScreen.id,
            arguments: category.id,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 27.0,
              backgroundImage: AssetImage(category.imageUrl),
            ),
            const SizedBox(height: 10.0),
            Text(category.title, style: kBodyTextStyle),
          ],
        ),
      ),
    );
  }
}
