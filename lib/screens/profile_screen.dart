import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';

class ProfileScreen extends StatelessWidget {
  Widget _topColumn() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      // decoration: BoxDecoration(
      //   gradient: kOnboardImageGradient,
      // ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 55.0,
          ),
          const SizedBox(width: 20.0),
          Flexible(
            fit: FlexFit.loose,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Jamiu Jimoh',
                  style: kTitleTextStyle,
                ),
                Text(
                  'hyperjay55@gmail.com',
                  style: kDescTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomColumn() {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: kScaffoldColor.withOpacity(1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _listItem(Icons.perm_identity, 'Profile', () {}),
          _listItem(Icons.storefront, 'My Shop', () {}),
          _listItem(Icons.electric_moped, 'Deliver With MatLyan', () {}),
          _listItem(Icons.settings, 'Settings', () {}),
          _listItem(Icons.logout, 'Log Out', () {}),
        ],
      ),
    );
  }

  Widget _listItem(IconData icon, String text, Function onPressed) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: 22.0,
                    color: kAccentColor,
                  ),
                  const SizedBox(width: 30.0),
                  Text(
                    text,
                    style: kBodyTextStyle.copyWith(fontSize: 15.7),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_right,
                  size: 24.0,
                  color: kAccentColor,
                ),
                onPressed: onPressed,
              ),
              // const SizedBox(height: 20.0),
            ],
          ),
        ),
        // const SizedBox(height: 10.0),
        const Divider(
          thickness: 0.15,
          color: kBorderColor,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('profile'),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: kOnboardBottomButtonGradient,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: _topColumn(),
                ),
                Expanded(
                  flex: 4,
                  child: _bottomColumn(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
