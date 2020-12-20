import '../models/slider_model.dart';

class Onboarding {
  List<SliderModel> _slidesData = [
    SliderModel(
      imagePath: 'assets/images/fruits2.jpg',
      title: 'Explore & Order',
      desc:
          'Explore to find your favorite home-cooked dishes prepared by your favorite local chefs.',
    ),
    SliderModel(
      imagePath: 'assets/images/meat.jpg',
      title: 'Become a vendor',
      desc:
          'Gain customers by preparing and selling your best well prepared and sumptuous dishes.',
    ),
    SliderModel(
      imagePath: 'assets/images/nuts.jpg',
      title: 'Deliver',
      desc: 'Earn by delivering food from vendors to consumers.',
    ),
  ];

  List<SliderModel> getSlides() {
    return _slidesData;
  }

  String getImageAssetPath(int index) {
    return _slidesData[index].imagePath;
  }

  String getTitle(int index) {
    return _slidesData[index].title;
  }

  String getDesc(int index) {
    return _slidesData[index].desc;
  }
}
