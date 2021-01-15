import '../providers/meal.dart';

class MealsData {
  final List<Meal> _loadedMeals = [
    Meal(
      id: 'p1',
      categories: ['c2', 'c3', 'c5', 'c7'],
      title: 'Meat',
      description: 'A red juicy meat - it is pretty juicy!',
      price: 29.99,
      imageUrl: 'assets/images/meat.jpg',
      ratings: 4.5,
      timeToPrep: 45,
    ),
    Meal(
      id: 'p2',
      categories: ['c1', 'c3', 'c4', 'c7'],
      title: 'Soup',
      description: 'A local ancient Chinese soup.',
      price: 59.99,
      imageUrl: 'assets/images/soup.jpg',
      ratings: 3.0,
      timeToPrep: 20,
    ),
    Meal(
      id: 'p3',
      categories: ['c2', 'c5', 'c6', 'c7'],
      title: 'Puff Puff',
      description: 'Dished puff puff with soup',
      price: 19.99,
      imageUrl: 'assets/images/yam.jpg',
      ratings: 3.5,
      timeToPrep: 30,
    ),
    Meal(
      id: 'p4',
      categories: ['c1', 'c2', 'c3', 'c5', 'c7'],
      title: 'Spag',
      description: 'Very long and curly spag',
      price: 49.99,
      imageUrl: 'assets/images/noodles.jpg',
      ratings: 4.0,
      timeToPrep: 15,
    ),
    Meal(
      id: 'p4',
      categories: ['c1', 'c3', 'c4' , 'c5', 'c6'],
      title: 'Fruits Salad',
      description: 'Juicy fruits salad',
      price: 39.99,
      imageUrl: 'assets/images/fruits3.jpg',
      ratings: 4.0,
      timeToPrep: 10,
    ),
  ];

  List<Meal> get loadedMeals {
    return [..._loadedMeals];
  }
}
