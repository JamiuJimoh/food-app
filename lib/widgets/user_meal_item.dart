import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/edit_user_meal_screen.dart';

class UserMealItem extends StatefulWidget {
  final String title;
  final String imageUrl;

  UserMealItem({
    @required this.title,
    @required this.imageUrl,
  });

  @override
  _UserMealItemState createState() => _UserMealItemState();
}

class _UserMealItemState extends State<UserMealItem> {
  var _isActive = true;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        _isActive ? Colors.white : Colors.grey,
        BlendMode.modulate,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 40.0,
          backgroundImage: AssetImage(widget.imageUrl),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: kDescTextStyle,
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: 23,
                  ),
                  onPressed: () => print('delete'),
                ),
                const SizedBox(width: 20.0),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 23,
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(EditUserMealScreen.id),
                ),
              ],
            ),
          ],
        ),
        trailing: Switch(
          activeColor: kAccentColor3,
          inactiveThumbColor: kAccentColor,
          inactiveTrackColor: kScaffoldColor,
          value: _isActive,
          onChanged: (value) {
            setState(() {
              print(value);
              _isActive = !_isActive;
            });
          },
        ),
      ),
    );
  }
}
