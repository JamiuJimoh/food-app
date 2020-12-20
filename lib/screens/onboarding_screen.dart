import 'package:flutter/material.dart';
import 'package:food_delivery/data/onboarding_data.dart';

import '../widgets/widgets.dart';
import 'screens.dart';
import '../constants.dart';
import '../models/slider_model.dart';

class OnboardingScreen extends StatefulWidget {
  static const String id = 'onboarding_screen';

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<OnboardingScreen> {
  List<SliderModel> _slides = [];
  Onboarding _onboarding = Onboarding();
  int _currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _slides = _onboarding.getSlides();
  }

  Widget bottomSheetDisplay() {
    if (_currentIndex != _slides.length - 1) {
      return Container(
        padding: EdgeInsets.only(bottom: 30.0, top: 10.0),
        color: kScaffoldColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CustomOutlinedButton(
              onTap: () {
                pageController.animateToPage(
                  _slides.length - 1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.linear,
                );
              },
              label: 'SKIP',
            ),
            Row(
              children: <Widget>[
                for (int i = 0; i < _slides.length; i++)
                  _currentIndex == i
                      ? pageIndexIndicator(true)
                      : pageIndexIndicator(false)
              ],
            ),
            CustomOutlinedButton(
              onTap: () {
                pageController.animateToPage(
                  _currentIndex + 1,
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: _slides.length,
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return SliderTile(
            imageName: _onboarding.getImageAssetPath(index),
            title: _onboarding.getTitle(index),
            desc: _onboarding.getDesc(index),
          );
        },
      ),
      bottomSheet: bottomSheetDisplay(),
    );
  }
}
