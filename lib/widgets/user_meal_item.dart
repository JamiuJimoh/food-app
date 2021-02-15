import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../mixins/interactive_dialog_mixin.dart';
import '../providers/meals.dart';
import '../constants.dart';
import '../screens/screens.dart';

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

class _UserMealItemState extends State<UserMealItem>
    with InteractiveDialogMixin {
  var _isActive = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(MealDetailScreen.id, arguments: widget.id),
      child: ColorFiltered(
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
                    onPressed: () {
                      warningDialog(context, () async {
                        try {
                          await Provider.of<Meals>(context, listen: false)
                              .deleteMeal(widget.id);
                          Navigator.of(context).pop();
                        } catch (error) {
                          errorDialog(context, () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          });
                        }
                      });
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
      ),
    );
  }
}
