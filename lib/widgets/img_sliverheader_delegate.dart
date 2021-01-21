import 'package:flutter/material.dart';
import 'package:food_delivery/providers/meal.dart';

import '../constants.dart';
import 'widgets.dart';

class ImageSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Meal loadedMeal;

  ImageSliverHeaderDelegate({
    this.expandedHeight,
    this.loadedMeal,
  });

  static const double roundedContainerHeight = 10.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Container(
          height: expandedHeight,
          child: Hero(
            tag: loadedMeal.id,
            child: Image.asset(
              loadedMeal.imageUrl,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          height: 120.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedIconButton(
                childWidget: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              RoundedIconButton(
                childWidget: FavoriteIconButton(loadedMeal: loadedMeal),
              ),
            ],
          ),
        ),
        Positioned(
          // top: expandedHeight - roundedContainerHeight - shrinkOffset,
          // left: 0,
          bottom: -2,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: BoxDecoration(
                color: kScaffoldColor.withOpacity(1.0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

///////////// TOGGLE FAVORITE BUTTON ////////////////
// To prevent the whole page from rebuilding when the 'favorite' icon button is clicked.

class FavoriteIconButton extends StatefulWidget {
  final Meal loadedMeal;

  const FavoriteIconButton({
    @required this.loadedMeal,
  });

  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(widget.loadedMeal.isFavorite
          ? Icons.favorite
          : Icons.favorite_border),
      onPressed: () {
        setState(() {
          widget.loadedMeal.toggleFavoriteStatus();
        });
      },
    );
  }
}
