import '../providers/meal.dart';

class MealsData {
  final List<Meal> _loadedMeals = [
    Meal(
      id: 'p1',
      categories: ['c2', 'c3', 'c5', 'c7'],
      title: 'Meat',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sollicitudin molestie malesuada.',
      price: 29.99,
      imageUrl: 'assets/images/meat.jpg',
      ratings: 4.5,
      reviews: 59,
      timeToPrep: 45,
      vendorInfo: null,
    ),
    Meal(
      id: 'p2',
      categories: ['c1', 'c3', 'c4', 'c7'],
      title: 'Soup',
      description:
          'Nulla quis lorem ut libero malesuada feugiat. Nulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      price: 59.99,
      imageUrl: 'assets/images/soup.jpg',
      ratings: 3.0,
      reviews: 53,
      timeToPrep: 20,
      vendorInfo: null,
    ),
    Meal(
      id: 'p3',
      categories: ['c2', 'c5', 'c6', 'c7'],
      title: 'Puff Puff',
      description:
          'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Nulla porttitor accumsan tincidunt. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.',
      price: 19.99,
      imageUrl: 'assets/images/yam.jpg',
      ratings: 3.5,
      reviews: 123,
      timeToPrep: 30,
      vendorInfo: null,
    ),
    Meal(
      id: 'p4',
      categories: ['c1', 'c2', 'c3', 'c5', 'c7'],
      title: 'Spag',
      description:
          'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec rutrum congue leo eget malesuada.',
      price: 49.99,
      imageUrl: 'assets/images/noodles.jpg',
      ratings: 4.0,
      reviews: 86,
      timeToPrep: 15,
      vendorInfo: null,
    ),
    Meal(
      id: 'p5',
      categories: ['c1', 'c3', 'c4', 'c5', 'c6'],
      title: 'Fruits Salad',
      description:
          'Nulla quis lorem ut libero malesuada feugiat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis lorem ut libero malesuada feugiat. Nulla porttitor accumsan tincidunt. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi',
      price: 39.99,
      imageUrl: 'assets/images/fruits3.jpg',
      ratings: 4.0,
      reviews: 573,
      timeToPrep: 10,
      vendorInfo: null,
    ),
  ];

  List<Meal> get loadedMeals {
    return [..._loadedMeals];
  }
}
