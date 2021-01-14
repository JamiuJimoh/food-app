import 'package:flutter/material.dart';

import '../constants.dart';

const containerHeight = 20.0;

class RoundedCatItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  RoundedCatItem({
    @required this.title,
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 27.0,
            backgroundImage: AssetImage(imageUrl),
          ),
          const SizedBox(height: 10.0),
          Text(title, style: kBodyTextStyle),
        ],
      ),
    );
  }
}
