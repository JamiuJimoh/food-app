import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/meal_detail_screen.dart';
import '../constants.dart';
import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem({@required this.order});

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  double _screenWidth;
  double _screenHeight;
  var _expanded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final mediaQuery = MediaQuery.of(context);
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        title: Text(
          widget.order.id,
          style: kDescTextStyle,
        ),
        subtitle: Text(
          'Ordered on ${DateFormat('dd-MM-yyyy hh:mm').format(widget.order.dateTime)}',
          style: TextStyle(color: kTextColor),
        ),
        trailing: IconButton(
          icon: Icon(
            _expanded ? Icons.expand_less : Icons.expand_more,
            color: kAccentColor3,
            size: 30.0,
          ),
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
            if (_expanded) {
              showModalBottomSheet(
                // backgroundColor: Color(0xFF000015),
                backgroundColor: Colors.transparent,
                context: context,
                builder: (ctx) {
                  return Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: Container(
                          width: _screenWidth,
                          height: _screenHeight / 1.5,
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: ListView(
                              children: widget.order.cartItems
                                  .map(
                                    (cartItem) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: GestureDetector(
                                        onTap: () =>
                                            Navigator.of(context).pushNamed(
                                          MealDetailScreen.id,
                                          arguments: cartItem.mealId,
                                        ),
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              cartItem.imageUrl,
                                            ),
                                            radius: 30.0,
                                          ),
                                          title: Text(
                                            '${cartItem.title}',
                                            style: kDescTextStyle,
                                          ),
                                          subtitle: Text(
                                            DateFormat('dd-MM-yyyy hh:mm')
                                                .format(widget.order.dateTime),
                                            style: TextStyle(color: kTextColor),
                                          ),
                                          trailing: Text(
                                            '${cartItem.quantity}   x   \$${cartItem.price}',
                                            style: kDescTextStyle.copyWith(
                                              color: kAccentColor3,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ).then((value) {
                setState(() {
                  _expanded = !_expanded;
                });
              });
            }
          },
        ),
      ),
    );
  }
}
