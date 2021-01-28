import 'dart:math';

import 'package:flutter/foundation.dart';

class CartItem {
  final String cartId;
  final String mealId;
  final String title;
  final String imageUrl;
  final int quantity;
  final double price;

  CartItem({
    @required this.cartId,
    @required this.mealId,
    @required this.title,
    @required this.imageUrl,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  double sumTotalAndDelivery(double totalAmount, double deliveryFee) {
    return totalAmount + deliveryFee;
  }

  double get generateDeliveryFee {
    if (totalAmount > 1.0) {
      Random random = new Random();
      return (random.nextDouble() * 3.99);
    } else {
      return 0.0;
    }
  }

  void addItem(String mealId, double price, String title, String imageUrl) {
    if (_items.containsKey(mealId)) {
      // change quantity...
      _items.update(
        mealId,
        (existingCartItem) => CartItem(
          cartId: existingCartItem.cartId,
          mealId: existingCartItem.mealId,
          imageUrl: existingCartItem.imageUrl,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        mealId,
        () => CartItem(
            cartId: DateTime.now().toString(),
            mealId: mealId,
            imageUrl: imageUrl,
            title: title,
            price: price,
            quantity: 1),
      );
    }
    notifyListeners();
  }

  void decreaseQuantity(String cartId, String mealId) {
    _items.update(
      mealId,
      (existingCartItem) => CartItem(
        cartId: existingCartItem.cartId,
        mealId: existingCartItem.mealId,
        imageUrl: existingCartItem.imageUrl,
        title: existingCartItem.title,
        price: existingCartItem.price,
        quantity:
            existingCartItem.quantity > 1 ? existingCartItem.quantity - 1 : 1,
      ),
    );
    notifyListeners();
  }

  void removeItem(String mealId) {
    _items.remove(mealId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
