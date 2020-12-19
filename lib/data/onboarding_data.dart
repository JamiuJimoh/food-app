class SliderModel {
  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath, this.title, this.desc});

  void setImageAssetPath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = List<SliderModel>();
  SliderModel sliderModel = SliderModel();

  //1
  sliderModel.setImageAssetPath('assets/images/fruits2.jpg');
  sliderModel.setTitle('Explore & Order');
  sliderModel.setDesc(
      'Explore to find your favorite home-cooked dishes prepared by your favorite local chefs.');
  slides.add(sliderModel);

  //2
  sliderModel = SliderModel();
  sliderModel.setImageAssetPath('assets/images/meat.jpg');
  sliderModel.setTitle('Become a vendor');
  sliderModel.setDesc(
      'Gain customers by preparing and selling your best well prepared and sumptuous dishes.');
  slides.add(sliderModel);

  //3
  sliderModel = SliderModel();
  sliderModel.setImageAssetPath('assets/images/nuts.jpg');
  sliderModel.setTitle('Deliver');
  sliderModel.setDesc('Earn by delivering food from vendors to consumers.');
  slides.add(sliderModel);

  return slides;
}
