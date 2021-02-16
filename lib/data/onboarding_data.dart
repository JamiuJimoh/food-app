import '../models/slider_model.dart';

class OnboardingData {
  List<SliderModel> _slidesData = [
    SliderModel(
      imagePath: 'assets/images/order.png',
      title: 'Explore & Order',
      desc:
          'Explore to find your favorite home-cooked dishes prepared by your favorite local chefs.',
    ),
    SliderModel(
      imagePath: 'assets/images/vendor.png',
      title: 'Become a vendor',
      desc:
          'Gain customers by preparing and selling your best well prepared and sumptuous dishes.',
    ),
    SliderModel(
      imagePath: 'assets/images/delivery.png',
      title: 'Deliver',
      desc: 'Earn by delivering food from vendors to consumers.',
    ),
  ];

  List<SliderModel> getSlides() {
    return [..._slidesData];
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
