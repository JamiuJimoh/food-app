import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/cart_item.dart';
import 'package:food_delivery/widgets/gradient_button.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/cart.dart' show Cart;

class CartScreen extends StatefulWidget {
  static const String id = 'cart_screen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Cart _cart;
  double _totalAmount;
  double _deliveryFee;
  double _sumTotalAndDelivery;
  int _itemCount;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final cart = Provider.of<Cart>(context);

    _cart = cart;
    _totalAmount = cart.totalAmount;
    _deliveryFee = cart.generateDeliveryFee;
    _sumTotalAndDelivery = cart.sumTotalAndDelivery(_totalAmount, _deliveryFee);
    _itemCount = cart.itemCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: ListView.builder(
                itemCount: _itemCount,
                itemBuilder: (ctx, i) => CartItem(
                  cartId: _cart.items.values.toList()[i].cartId,
                  mealId: _cart.items.values.toList()[i].mealId,
                  title: _cart.items.values.toList()[i].title,
                  imageUrl: _cart.items.values.toList()[i].imageUrl,
                  price: _cart.items.values.toList()[i].price,
                  quantity: _cart.items.values.toList()[i].quantity,
                  // style: kDescTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: kDescTextStyle.copyWith(fontSize: 20.0),
                      ),
                      Text(
                        '\$${_totalAmount.toStringAsFixed(2)}',
                        style: kPriceTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee',
                        style: kDescTextStyle.copyWith(fontSize: 20.0),
                      ),
                      Text(
                        '\$${_deliveryFee.toStringAsFixed(2)}',
                        style: kPriceTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  const Divider(
                    color: kBorderColor,
                    thickness: 0.8,
                    height: 20.0,
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: kDescTextStyle.copyWith(fontSize: 20.0),
                      ),
                      Text(
                        '\$${_sumTotalAndDelivery.toStringAsFixed(2)}',
                        style: kPriceTextStyle,
                      ),
                    ],
                  ),
                  const Spacer(),
                  GradientButton(
                    context: context,
                    label: 'Order Now',
                    onTap: () {},
                    isCurved: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
