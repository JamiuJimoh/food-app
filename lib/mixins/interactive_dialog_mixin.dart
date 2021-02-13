import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/custom_dialog.dart';

import '../constants.dart';

class InteractiveDialogMixin {
  void successDialog(BuildContext context, VoidCallback callBack) {
    showDialog(
      context: context,
      builder: (ctx) {
        return CustomDialog(
          title: 'Success',
          description: '1 item added to cart.',
          image: AssetImage('assets/images/tick.gif'),
          clickable: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Goto Cart',
                style: kDescTextStyle.copyWith(color: kAccentColor3),
              ),
              const SizedBox(width: 5.0),
              Icon(
                Icons.arrow_forward,
                color: kAccentColor3,
                size: 17.0,
              ),
            ],
          ),
          onPressed: callBack,
        );
      },
    );
  }

  void warningDialog(
    BuildContext context, [
    VoidCallback callback,
    String title,
    String description,
    String dismissText,
    IconData icon,
  ]) {
    showDialog(
      context: context,
      builder: (ctx) {
        return CustomDialog(
          title: title ?? 'Warning',
          description:
              description ?? 'Are you sure you want to delete this item?',
          image: AssetImage('assets/images/caution.gif'),
          clickable: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                dismissText ?? 'Yes',
                style: kDescTextStyle.copyWith(color: kAccentColor3),
              ),
              const SizedBox(width: 5.0),
              Icon(
                icon ?? Icons.delete_forever,
                color: kAccentColor3,
                size: 17.0,
              ),
            ],
          ),
          onPressed: callback,
        );
      },
    );
  }
}
