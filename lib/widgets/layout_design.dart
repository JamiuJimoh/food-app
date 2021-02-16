import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';

enum ColumnFlexValue { firstColumn, secondColumn }

class LayoutDesign extends StatelessWidget {
  final int firstColumnFlex;
  final Widget firstColumnChild;
  final int secondColumnFlex;
  final Widget secondColumnChild;
  final Color firstColumnColor;

  LayoutDesign({
    @required this.firstColumnFlex,
    @required this.secondColumnFlex,
    @required this.firstColumnChild,
    @required this.secondColumnChild,
    this.firstColumnColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: firstColumnFlex,
            child: Container(
              child: firstColumnChild,
              decoration: BoxDecoration(
                color: firstColumnColor ?? kSecondaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: secondColumnFlex,
            child: secondColumnChild,
          ),
        ],
      ),
    );
  }
}
