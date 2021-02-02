import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/edit_product_creen.dart';

const double _listContainerHeight = 110.0;
const double _imageContainerWidth = 110.0;

class UserProductItem extends StatefulWidget {
  final String title;
  final String imageUrl;

  UserProductItem({
    @required this.title,
    @required this.imageUrl,
  });

  @override
  _UserProductItemState createState() => _UserProductItemState();
}

class _UserProductItemState extends State<UserProductItem> {
  bool _isActive = true;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        _isActive ? Colors.white : Colors.grey,
        BlendMode.modulate,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        width: double.infinity,
        height: _listContainerHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: _imageContainerWidth,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              widget.imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          width: _imageContainerWidth,
                          height: 30.0,
                          color: kSecondaryColor.withOpacity(0.8),
                          child: Switch(
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
                    ],
                  ),
                  const SizedBox(width: 20.0),
                  Text(
                    '${widget.title}',
                    style: kDescTextStyle,
                  ),
                ],
              ),
              Container(
                width: 60.0,
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                color: kSecondaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.delete,
                        size: 23,
                      ),
                      onTap: () => print('delete'),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.edit,
                        size: 23,
                      ),
                      onTap: () =>
                          Navigator.of(context).pushNamed(EditProductScreen.id),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
