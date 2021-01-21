import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/widgets.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListTileCard(),
    );
  }
}
