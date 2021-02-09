import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../screens/meal_detail_screen.dart';
import '../providers/cart.dart';
import 'counter.dart';

const double _cartItemHeight = 110.0;
const double _imgContainerWidth = 110.0;

class CartItem extends StatefulWidget {
  final String cartId;
  final String mealId;
  final String title;
  final String imageUrl;
  final double price;
  final int quantity;
  final Function toggleIsEmpty;

  const CartItem({
    @required this.cartId,
    @required this.mealId,
    @required this.title,
    @required this.imageUrl,
    @required this.price,
    @required this.quantity,
    @required this.toggleIsEmpty,
  });

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  double _mealDetailsContainerWidth;
  static const double _totalContainersHorizontalPadding = 30.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    _mealDetailsContainerWidth = mediaQueryWidth -
        _imgContainerWidth -
        _totalContainersHorizontalPadding;
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return Dismissible(
      key: ValueKey(widget.cartId),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: kTextColor,
          size: 40.0,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      ),
      onDismissed: (direction) {
        cart.removeItem(widget.mealId);
        if (cart.itemCount < 1) {
          widget.toggleIsEmpty();
        }
      },
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(
          MealDetailScreen.id,
          arguments: widget.mealId,
        ),
        child: Container(
          margin: const EdgeInsets.all(10.0),
          height: _cartItemHeight,
          width: double.infinity,
          child: Row(
            children: [
              Hero(
                tag: widget.mealId,
                child: Container(
                  width: _imgContainerWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                width: _mealDetailsContainerWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: kDescTextStyle,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          '\$${widget.price}',
                          style: kPriceTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Counter(
                          quantity: widget.quantity,
                          onAddButtonPressed: () {
                            cart.addItem(
                              widget.mealId,
                              widget.price,
                              widget.title,
                              widget.imageUrl,
                            );
                          },
                          onRemoveButtonPressed: widget.quantity == 1
                              ? () {}
                              : () {
                                  cart.decreaseQuantity(
                                    widget.cartId,
                                    widget.mealId,
                                  );
                                },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
