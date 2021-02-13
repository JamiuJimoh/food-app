import 'package:flutter/material.dart';

import '../constants.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String description;
  final AssetImage image;
  final Widget clickable;
  final Function onPressed;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.image,
    this.clickable,
    @required this.onPressed,
  });

  Widget _dialogContent(BuildContext build) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 80.0,
            bottom: 14.0,
            left: 14.0,
            right: 14.0,
          ),
          margin: const EdgeInsets.only(top: 30.0),
          decoration: BoxDecoration(
            color: kSecondaryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: kTitleTextStyle,
                ),
                const SizedBox(height: 10.0),
                Text(
                  description,
                  style: kDescTextStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: onPressed,
                    child: clickable ??
                        Text(
                          'Yes',
                          style: kPriceTextStyle.copyWith(color: kAccentColor3),
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 14.0,
          right: 14.0,
          child: CircleAvatar(
            backgroundColor: kSecondaryColor,
            radius: 65.0,
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: kSecondaryColor,
                  backgroundImage: image,
                  radius: 30.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _dialogContent(context),
    );
  }
}
