import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType textInputType;
  final bool isPasswordInputField;
  final TextInputAction textInputAction;
  final int maxLines;
  final TextEditingController controller;
  final double paddingBottom;
  final FocusNode focusNode;
  final Function(String) onFieldSubmitted;
  final Function(String) onSaved;
  final Function(String) validator;

  const CustomTextField({
    @required this.label,
    @required this.textInputType,
    @required this.isPasswordInputField,
    this.textInputAction,
    this.maxLines,
    this.controller,
    this.paddingBottom,
    this.focusNode,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
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
      padding: EdgeInsets.only(top: 15.0, bottom: paddingBottom ?? 15.0),
      child: TextFormField(
        validator: validator,
        onSaved: onSaved,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        controller: controller,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        maxLines: maxLines,
        decoration: InputDecoration(
          enabledBorder: _outlineInputBorder(kAccentColor),
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          labelText: label,
          labelStyle: kBodyTextStyle.copyWith(
            color: kFormLabelColor,
          ),
          errorBorder: _outlineInputBorder(kAccentColor),
          focusedBorder: _outlineInputBorder(kAccentColor2),
        ),
        style: kDescTextStyle,
        obscureText: isPasswordInputField,
        cursorColor: kAccentColor2,
      ),
    );
  }
}
