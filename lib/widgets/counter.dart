import 'package:flutter/material.dart';

import '../constants.dart';

class Counter extends StatelessWidget {
  final int quantity;
  final Function onAddButtonPressed;
  final Function onRemoveButtonPressed;

  Counter({
    @required this.quantity,
    @required this.onAddButtonPressed,
    @required this.onRemoveButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      width: 150.0,
      color: kSecondaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(Icons.remove), onPressed: onRemoveButtonPressed),
          Text(
            '${quantity}',
            style: kDescTextStyle,
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: onAddButtonPressed,
          ),
        ],
      ),
    );
  }
}
