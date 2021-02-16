import 'package:flutter/material.dart';

import '../constants.dart';

class SliderTile extends StatelessWidget {
  final String imageName, title, desc;

  SliderTile({
    @required this.imageName,
    @required this.title,
    @required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kScaffoldColor,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                Container(
                  // margin: const EdgeInsets.all(40.0),
                  // padding: const EdgeInsets.all(40.0),
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageName),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: kOnboardImageGradient,
                  ),
                ),
              ],
            ),
            
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Text(
                        title,
                        style: kTitleTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      desc,
                      style: kDescTextStyle.copyWith(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
