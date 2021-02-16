import 'package:flutter/material.dart';
import 'package:food_delivery/mixins/interactive_dialog_mixin.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatefulWidget {
  static const String id = 'orders_screen';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with InteractiveDialogMixin {
  var _isEmpty = false;
  // Orders _orders;
  Future _ordersFuture;

  void _toggleIsEmpty(int ordersListLength) {
    if (ordersListLength > 0) {
      setState(() {
        _isEmpty = false;
      });
    } else {
      setState(() {
        _isEmpty = true;
      });
    }
  }

  Future _obtainOrdersFuture() {
    final ordersData = Provider.of<Orders>(context, listen: false);
    // _orders = ordersData;
    return ordersData.fetchAndSetOrders();
  }

  @override
  void initState() {
    final orders = Provider.of<Orders>(context, listen: false);

    _ordersFuture = _obtainOrdersFuture();
    if (orders != null) {
      _toggleIsEmpty(orders.ordersListLength);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _toggleIsEmpty(orderData.ordersListLength);

    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: _isEmpty
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
          : FutureBuilder(
              future: _ordersFuture,
              builder: (ctx, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  if (dataSnapshot.error != null) {
                    // Do error handling
                    return Center(
                      child: Text('An error occured', style: kDescTextStyle),
                    );
                  } else {
                    return Consumer<Orders>(
                      builder: (ctx, orderData, child) => ListView.builder(
                        itemCount: orderData.ordersListLength,
                        itemBuilder: (ctx, i) => OrderItem(
                          order: orderData.orders[i],
                        ),
                      ),
                    );
                  }
                }
              },
            ),
    );
  }
}
