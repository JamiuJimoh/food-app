import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType textInputType;
  final bool isPasswordInputField;

  const CustomTextField({
    @required this.label,
    @required this.textInputType,
    @required this.isPasswordInputField,
  });

  OutlineInputBorder _outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(50.0),
      ),
      borderSide: BorderSide(color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: TextField(
        keyboardType: textInputType,
        decoration: InputDecoration(
          enabledBorder: _outlineInputBorder(kAccentColor),
          contentPadding: const EdgeInsets.fromLTRB(20, 16, 12, 16),
          hintText: label,
          hintStyle: kDescTextStyle.copyWith(
            color: Colors.grey[500],
            fontSize: 17.0,
          ),
          focusedBorder: _outlineInputBorder(kAccentColor2),
        ),
        style: kDescTextStyle,
        obscureText: isPasswordInputField,
        cursorColor: kAccentColor2,
      ),
    );
  }
}
