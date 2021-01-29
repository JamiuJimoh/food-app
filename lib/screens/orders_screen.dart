import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatefulWidget {
  static const String id = 'orders_screen';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  var _isEmpty = false;

  void _toggleIsEmpty(int ordersListLength) {
    setState(() {
      if (ordersListLength > 0) {
        _isEmpty = false;
      } else {
        _isEmpty = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    final orders = orderData.orders;

    _toggleIsEmpty(orderData.ordersListLength);

    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body:  _isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 100.0,
                    // color: kAccentColor,
                    child: Text(
                      'No orders yet!',
                      style: kDescTextStyle,
                    ),
                  ),
                ),
              ],
            )
          :ListView.builder(
        itemCount: orderData.ordersListLength,
        itemBuilder: (ctx, i) => OrderItem(order: orders[i]),
      ),
    );
  }
}
