import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';

class OrdersScreen extends StatelessWidget {
  static const String id = 'orders_screen';
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      // body: ListTileCard(),
    );
  }
}
