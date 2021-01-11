import '../models/meal.dart';

class MealData {
  final List<Meal> _loadedMeals = [
    Meal(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl: 'assets/images/meat.jpg',
    ),
    Meal(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl: 'assets/images/soup.jpg',
    ),
    Meal(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl: 'assets/images/yam.jpg',
    ),
    Meal(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl: 'assets/images/noodles.jpg',
    ),
  ];

  List<Meal> get loadedMeals {
    return [..._loadedMeals];
  }
}
