import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> cartItems;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.cartItems,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  static const serverUrl = 'https://matlyan-default-rtdb.firebaseio.com/';

  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  int get ordersListLength {
    return _orders.length;
  }

  Future<void> fetchAndSetOrders() async {
    const url = '$serverUrl/orders.json';
    final response = await http.get(url);
    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(OrderItem(
        id: orderId,
        amount: orderData['amount'],
        dateTime: DateTime.parse(orderData['dateTime']),
        cartItems: (orderData['cartItems'] as List<dynamic>)
            .map(
              (item) => CartItem(
                cartId: item['id'],
                mealId: item['mealId'],
                title: item['title'],
                imageUrl: item['imageUrl'],
                quantity: item['quantity'],
                price: item['price'],
              ),
            )
            .toList(),
      ));
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartItems, double total) async {
    const url = '$serverUrl/orders.json';
    final timestamp = DateTime.now();

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'amount': total,
            'dateTime': timestamp.toIso8601String(),
            'cartItems': cartItems
                .map((ci) => {
                      'id': ci.cartId,
                      'title': ci.title,
                      'quantity': ci.quantity,
                      'price': ci.price,
                      'imageUrl': ci.imageUrl,
                      'mealId': ci.mealId,
                    })
                .toList(),
          },
        ),
      );

      _orders.insert(
        0,
        OrderItem(
          id: json.decode(response.body)['name'],
          amount: total,
          cartItems: cartItems,
          dateTime: timestamp,
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
