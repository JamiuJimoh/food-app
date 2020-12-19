import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'screens.dart';
import '../constants.dart';
import '../data/onboarding_data.dart';

class Onboarding extends StatefulWidget {
  static const String id = 'onboarding_screen';

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<SliderModel> slides = List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  Widget bottomSheetDisplay() {
    if (currentIndex != slides.length - 1) {
      return Container(
        padding: EdgeInsets.only(bottom: 30.0, top: 10.0),
        color: kScaffoldColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CustomOutlinedButton(
              onTap: () {
                pageController.animateToPage(
                  slides.length - 1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.linear,
                );
              },
              label: 'SKIP',
            ),
            Row(
              children: <Widget>[
                for (int i = 0; i < slides.length; i++)
                  currentIndex == i
                      ? pageIndexIndicator(true)
                      : pageIndexIndicator(false)
              ],
            ),
            CustomOutlinedButton(
              onTap: () {
                pageController.animateToPage(
                  currentIndex + 1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.linear,
                );
              },
              label: 'NEXT',
            ),
          ],
        ),
      );
    } else {
      return GradientButton(
        context: context,
        label: 'Get Started',
        isCurved: false,
        onTap: () {
          Navigator.pushNamed(context, LoginScreen.id);
        },
      );
    }
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 4.0,
      width: isCurrentPage ? 20.0 : 13.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? kAccentColor : Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: slides.length,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return SliderTile(
            imageName: slides[index].getImageAssetPath(),
            title: slides[index].getTitle(),
            desc: slides[index].getDesc(),
          );
        },
      ),
      bottomSheet: bottomSheetDisplay(),
    );
  }
}
