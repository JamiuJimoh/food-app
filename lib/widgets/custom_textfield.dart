import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType textInputType;
  final bool isPasswordInputField;
  final TextInputAction textInputAction;
  final int maxLines;

  const CustomTextField({
    @required this.label,
    @required this.textInputType,
    @required this.isPasswordInputField,
    this.textInputAction,
    this.maxLines,
  });

  OutlineInputBorder _outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
      borderSide: BorderSide(color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: TextFormField(
        keyboardType: textInputType,
        textInputAction: textInputAction,
        maxLines: maxLines,
        decoration: InputDecoration(
          enabledBorder: _outlineInputBorder(kAccentColor),
          contentPadding: const EdgeInsets.fromLTRB(20, 16, 12, 16),
          labelText: label,
          labelStyle: kBodyTextStyle.copyWith(
            color: kFormLabelColor,
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
