import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';

enum ColumnFlexValue { firstColumn, secondColumn }

class LayoutDesign extends StatelessWidget {
  final int firstColumnFlex;
  final Widget firstColumnChild;
  final int secondColumnFlex;
  final Widget secondColumnChild;

  LayoutDesign({
    @required this.firstColumnFlex,
    @required this.secondColumnFlex,
    @required this.firstColumnChild,
    @required this.secondColumnChild,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: firstColumnFlex,
          child: firstColumnChild,
        ),
        Expanded(
          flex: secondColumnFlex,
          child: Container(
            child: secondColumnChild,
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
