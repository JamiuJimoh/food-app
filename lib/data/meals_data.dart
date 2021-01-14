import '../providers/meal.dart';

class MealsData {
  final List<Meal> _loadedMeals = [
    Meal(
      id: 'p1',
      title: 'Meat',
      description: 'A red juicy meat - it is pretty juicy!',
      price: 29.99,
      imageUrl: 'assets/images/meat.jpg',
      ratings: 4.5,
      timeToPrep: DateTime.now(),
    ),
    Meal(
      id: 'p2',
      title: 'Soup',
      description: 'A local ancient Chinese soup.',
      price: 59.99,
      imageUrl: 'assets/images/soup.jpg',
      ratings: 3.0,
      timeToPrep: DateTime.now(),
    ),
    Meal(
      id: 'p3',
      title: 'Puff Puff',
      description: 'Dished puff puff with soup',
      price: 19.99,
      imageUrl: 'assets/images/yam.jpg',
      ratings: 3.5,
      timeToPrep: DateTime.now(),
    ),
    Meal(
      id: 'p4',
      title: 'Spag',
      description: 'Very long and curly spag',
      price: 49.99,
      imageUrl: 'assets/images/noodles.jpg',
      ratings: 4.0,
      timeToPrep: DateTime.now(),
    ),
  ];

  List<Meal> get loadedMeals {
    return [..._loadedMeals];
  }
}
