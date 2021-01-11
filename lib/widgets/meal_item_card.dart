import 'package:flutter/material.dart';

class MealItemCard extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  MealItemCard({
    this.id,
    this.title,
    this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.asset(imageUrl),
    );
  }
}
