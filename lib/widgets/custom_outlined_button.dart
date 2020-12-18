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
    return OutlineButton(
      child: Text(
        label,
        style: kOnboardButtonTextStyle,
      ),
      onPressed: onTap,
      borderSide: BorderSide(
        color: kAccentColor,
      ),
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
    );
  }
}
