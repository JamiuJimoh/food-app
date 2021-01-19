import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedIconButton extends StatelessWidget {
  // final Meal meal;
  final Widget childWidget;

  const RoundedIconButton({
    // @required this.meal,
    @required this.childWidget,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor,
          shape: BoxShape.circle,
        ),
        // padding: const EdgeInsets.all(1.0),
        child: childWidget,
      ),
    );
  }
}
