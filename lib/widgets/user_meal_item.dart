import 'package:flutter/material.dart';
import 'package:food_delivery/providers/meals.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../screens/edit_user_meal_screen.dart';
import 'custom_dialog.dart';

class UserMealItem extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String id;

  UserMealItem({
    @required this.title,
    @required this.imageUrl,
    @required this.id,
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
          backgroundImage: NetworkImage(
            widget.imageUrl,
          ),
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
                  // onPressed: () => Provider.of<Meals>(context, listen: false)
                  //     .deleteMeal(widget.id),

                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return CustomDialog(
                          title: 'Warning',
                          description:
                              'Are you sure you want to delete this item?',
                          image: AssetImage('assets/images/caution.gif'),
                          clickable: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Yes',
                                style: kDescTextStyle.copyWith(
                                    color: kAccentColor3),
                              ),
                              const SizedBox(width: 5.0),
                              Icon(
                                Icons.delete_forever,
                                color: kAccentColor3,
                                size: 17.0,
                              ),
                            ],
                          ),
                          onPressed: () {
                            Provider.of<Meals>(context, listen: false)
                                .deleteMeal(widget.id);
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    );
                  },
                ),
                const SizedBox(width: 20.0),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 23,
                  ),
                  onPressed: () => Navigator.of(context)
                      .pushNamed(EditUserMealScreen.id, arguments: widget.id),
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
