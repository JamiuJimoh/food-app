import '../models/categories.dart';

class CategoriesData {
  final List<Categories> _categoriesList = [
    Categories(
      id: 'c1',
      title: 'Breakfast',
      imageUrl: 'assets/images/eggs.jpg',
    ),
    Categories(
      id: 'c2',
      title: 'Lunch',
      imageUrl: 'assets/images/fruits.jpg',
    ),
    Categories(
      id: 'c3',
      title: 'Dinner',
      imageUrl: 'assets/images/sandwich.jpg',
    ),
    Categories(
      id: 'c4',
      title: 'Vegan',
      imageUrl: 'assets/images/veggies.jpg',
    ),
    Categories(
      id: 'c4',
      title: 'Halal',
      imageUrl: 'assets/images/fruits.jpg',
    ),
  ];

  List<Categories> get categoriesList {
    return [..._categoriesList];
  }

  int get catListLength{
    return _categoriesList.length;
  }
}
