import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import '../providers/orders.dart' as ord;

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;

  OrderItem({@required this.order});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(order.cartItem.imageUrl),
          radius: 30.0,
          // child: Text('${order.cartItem.quantity}'),
        ),
        title: Text(
          '${order.cartItem.title}',
          style: kDescTextStyle,
        ),
        subtitle: Text(
          DateFormat('dd-MM-yyyy hh:mm').format(order.dateTime),
          style: TextStyle(color: kTextColor),
        ),
        trailing: Text(
          '${order.cartItem.quantity}   x   \$${order.amount}',
          style: kDescTextStyle,
        ),
      ),
    );
  }
}
