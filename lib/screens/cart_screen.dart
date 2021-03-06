import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../mixins/mixins.dart';
import '../widgets/widgets.dart';
import '../constants.dart';
import '../providers/orders.dart';
import '../providers/cart.dart' show Cart;
import 'orders_screen.dart';

class CartScreen extends StatefulWidget {
  static const String id = 'cart_screen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with InteractiveDialogMixin, AppBarMixin {
  Cart _cart;
  double _totalAmount;
  double _deliveryFee;
  double _sumTotalAndDelivery;
  int _itemCount;
  var _isEmpty = false;
  var _isLoading = false;

  void _checkIsEmpty(int cartListLength) {
    setState(() {
      if (cartListLength > 0) {
        _isEmpty = false;
      } else {
        _isEmpty = true;
      }
    });
  }

  @override
  void didChangeDependencies() {
    final cart = Provider.of<Cart>(context);

    _cart = cart;
    _totalAmount = cart.totalAmount;
    _deliveryFee = cart.generateDeliveryFee;
    _sumTotalAndDelivery = cart.sumTotalAndDelivery(_totalAmount, _deliveryFee);
    _itemCount = cart.itemCount;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _checkIsEmpty(_itemCount);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          bottom: bottomBorder(),
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
                        'Your cart is empty!',
                        style: kDescTextStyle,
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Expanded(
                    flex: 6,
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
                          toggleIsEmpty: () => _checkIsEmpty(_itemCount),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
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
                            childWidget: _isLoading
                                ? Center(child: CircularProgressIndicator())
                                : null,
                            context: context,
                            label: 'Order Now',
                            onTap: () async {
                              setState(() {
                                _isLoading = true;
                              });
                              try {
                                await Provider.of<Orders>(context,
                                        listen: false)
                                    .addOrder(
                                  _cart.items.values.toList(),
                                  _cart.totalAmount,
                                );
                                setState(() {
                                  _isLoading = true;
                                });
                                _cart.clear();
                                orderSuccessDialog(
                                  context,
                                  () => Navigator.of(context)
                                      .pushReplacementNamed(OrdersScreen.id),
                                );
                              } catch (error) {
                                errorDialog(context, () {
                                  Navigator.of(context).pop();
                                  setState(() {
                                    _isLoading = false;
                                  });
                                });
                              }
                            },
                            isCurved: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
