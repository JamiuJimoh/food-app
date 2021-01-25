import 'package:flutter/material.dart';

import '../constants.dart';

final Color borderSidedColor = kBorderColor.withOpacity(0.6);
const double borderSideWidth = 1.25;

class BorderedContainer extends StatelessWidget {
  final Widget childWidget;
  BorderedContainer({this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(9.0)),
        color: kScaffoldColor,
        border: Border(
          top: BorderSide(width: borderSideWidth, color: borderSidedColor),
          bottom: BorderSide(width: borderSideWidth, color: borderSidedColor),
          left: BorderSide(width: borderSideWidth, color: borderSidedColor),
          right: BorderSide(width: borderSideWidth, color: borderSidedColor),
        ),
      ),
      child: childWidget,
    );
  }
}
