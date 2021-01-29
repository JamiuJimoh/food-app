import 'package:flutter/cupertino.dart';

import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final CartItem cartItem;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.cartItem,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  int get ordersListLength {
    return _orders.length;
  }

  void addOrder(List<CartItem> cartItems) {
    cartItems.forEach((item) {
      _orders.insert(
        0,
        OrderItem(
          id: DateTime.now().toString(),
          amount: item.price,
          cartItem: item,
          dateTime: DateTime.now(),
        ),
      );
    });
    notifyListeners();
  }
}
