import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/widgets.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('favorites'),
      ),
      body: BorderedContainer(),
    );
  }
}
