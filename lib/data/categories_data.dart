import '../providers/category.dart';

class CategoriesData {
  final List<Category> _categoriesList = [
    Category(
      id: 'c1',
      title: 'Breakfast',
      imageUrl: 'assets/images/eggs.jpg',
    ),
    Category(
      id: 'c2',
      title: 'Lunch',
      imageUrl: 'assets/images/fruits.jpg',
    ),
    Category(
      id: 'c3',
      title: 'Dinner',
      imageUrl: 'assets/images/sandwich.jpg',
    ),
    Category(
      id: 'c4',
      title: 'Vegan',
      imageUrl: 'assets/images/veggies.jpg',
    ),
    Category(
      id: 'c5',
      title: 'Halal',
      imageUrl: 'assets/images/fruits2.jpg',
    ),
    Category(
      id: 'c6',
      title: 'Bakery',
      imageUrl: 'assets/images/burger.jpg',
    ),
    Category(
      id: 'c7',
      title: 'Family Meals',
      imageUrl: 'assets/images/fruits3.jpg',
    ),
  ];

  List<Category> get categoriesList {
    return [..._categoriesList];
  }
}
