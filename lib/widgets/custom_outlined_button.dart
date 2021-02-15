import 'package:flutter/material.dart';

import '../constants.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String label;
  final Function onTap;

  const CustomOutlinedButton({
    @required this.onTap,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        label,
        style: kOnboardButtonTextStyle,
      ),
      onPressed: onTap,
      clipBehavior: Clip.hardEdge,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: kAccentColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
