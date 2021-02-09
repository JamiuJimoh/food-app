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
      imageUrl: 'https://images.unsplash.com/photo-1592894869086-f828b161e90a?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=500&q=40.png',
      ratings: 4.5,
      reviews: 59,
      timeToPrep: 45,
      vendorInfo: null,
      distance: 24.5,
      location: '97, Stockholm',
    ),
    Meal(
      id: 'p2',
      categories: ['c1', 'c3', 'c4', 'c7'],
      title: 'Soup',
      description:
          'Nulla quis lorem ut libero malesuada feugiat. Nulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      price: 59.99,
      imageUrl: 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2019%2F02%2F28%2Ffaux-tato-soup-dcms-large-2000.jpg',
      ratings: 3.0,
      reviews: 53,
      timeToPrep: 20,
      vendorInfo: null,
      distance: 12.0,
      location: '15, Valhala',
    ),
    Meal(
      id: 'p3',
      categories: ['c2', 'c5', 'c6', 'c7'],
      title: 'Yam',
      description:
          'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Nulla porttitor accumsan tincidunt. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.',
      price: 19.99,
      imageUrl: 'https://www.crunchycreamysweet.com/wp-content/uploads/2018/11/classic-sweet-potato-casserole-2.jpg',
      ratings: 3.5,
      reviews: 123,
      timeToPrep: 30,
      vendorInfo: null,
      distance: 18.3,
      location: '23, Vala',
    ),
    Meal(
      id: 'p4',
      categories: ['c1', 'c2', 'c3', 'c5', 'c7'],
      title: 'Pasta',
      description:
          'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. , porttitor at Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur arcu erat, accumsan id imperdiet et, porttitor at Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur arcu erat, accumsan id imperdiet et, porttitor at rutrum congue leo eget malesuada.',
      price: 49.99,
      imageUrl: 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/spaghetti-puttanesca_1-1ce4e81.jpg?quality=90&resize=560,472',
      ratings: 4.0,
      reviews: 86,
      timeToPrep: 15,
      vendorInfo: null,
      distance: 43.8,
      location: '31, Moghulis',
    ),
    Meal(
      id: 'p5',
      categories: ['c1', 'c3', 'c4', 'c5', 'c6'],
      title: 'Fruits Salad',
      description:
          'Nulla quis lorem ut libero malesuada feugiat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis lorem ut libero malesuada feugiat. Nulla porttitor accumsan tincidunt. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi',
      price: 39.99,
      imageUrl: 'https://juliasalbum.com/wp-content/uploads/2016/10/winter-fruit-salad-with-maple-lime-dressing.jpg',
      ratings: 4.0,
      reviews: 573,
      timeToPrep: 10,
      vendorInfo: null,
      distance: 21.5,
      location: '64, Indie',
    ),
  ];

  List<Meal> get loadedMeals {
    return [..._loadedMeals];
  }
}
