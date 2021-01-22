import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/selected_category_screen..dart';
import '../providers/category.dart';
import '../constants.dart';

const containerHeight = 20.0;

class RoundedCatItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Category>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: () {
          print('${category.id}');
          Navigator.of(context).pushNamed(
            SelectedCategoryScreen.id,
            arguments: category.id,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 26.0,
              backgroundImage: AssetImage(category.imageUrl),
            ),
            Text(category.title, style: kBodyTextStyle),
          ],
        ),
      ),
    );
  }
}
