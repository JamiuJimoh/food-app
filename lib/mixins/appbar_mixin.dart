import 'package:flutter/material.dart';

import '../constants.dart';

class AppBarMixin {
  PreferredSizeWidget bottomBorder() {
    return PreferredSize(
      child: Container(
        color: kBorderColor,
        height: 0.29,
      ),
      preferredSize: Size.fromHeight(0.29),
    );
  }
}
