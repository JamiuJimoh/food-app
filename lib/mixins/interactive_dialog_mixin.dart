import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/custom_dialog.dart';

import '../constants.dart';

class InteractiveDialogMixin {
  void cartSuccessDialog(BuildContext context, VoidCallback callBack) {
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

  void orderSuccessDialog(BuildContext context, VoidCallback callBack) {
    showDialog(
      context: context,
      builder: (ctx) {
        return CustomDialog(
          title: 'Success',
          description: 'item ordered successfully.',
          image: AssetImage('assets/images/tick.gif'),
          clickable: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Ticket',
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
    BuildContext context,
    VoidCallback callback,
  ) {
    showDialog(
      context: context,
      builder: (ctx) {
        return CustomDialog(
          title: 'Warning',
          description: 'Are you sure you want to delete this item?',
          image: AssetImage('assets/images/caution.gif'),
          clickable: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Yes',
                style: kDescTextStyle.copyWith(color: kAccentColor3),
              ),
              const SizedBox(width: 5.0),
              Icon(
                Icons.delete_forever,
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

  void errorDialog(
    BuildContext context,
    VoidCallback callback, [
    String errorMessage,
  ]) {
    showDialog(
      context: context,
      builder: (ctx) {
        return CustomDialog(
          title: 'Failed',
          description: errorMessage ?? 'Oops, Something went wrong.',
          image: AssetImage('assets/images/caution.gif'),
          clickable: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Close',
                style: kDescTextStyle.copyWith(color: kAccentColor3),
              ),
              const SizedBox(width: 5.0),
              Icon(
                Icons.close,
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
