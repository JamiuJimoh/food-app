
import 'package:flutter/material.dart';

import '../constants.dart';
import 'widgets.dart';

class AuthenticationWidget extends StatelessWidget {
  final String titleMessage;
  final List<CustomTextField> customTextField;
  final String label;
  final Function onButtonClicked;
  final String bottomMessage;
  final String bottomMessageLink;
  final Function onBottomLinkClicked;

  const AuthenticationWidget({
    @required this.titleMessage,
    @required this.customTextField,
    @required this.label,
    @required this.onButtonClicked,
    @required this.bottomMessage,
    @required this.bottomMessageLink,
    @required this.onBottomLinkClicked,
  });

  Column _createCustomTextField(List<CustomTextField> customTextField) {
    return Column(
      children: customTextField,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titleMessage,
              style: kTitleTextStyle.copyWith(fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            _createCustomTextField(customTextField),
            const SizedBox(height: 40.0),
            GradientButton(
              context: context,
              label: label,
              isCurved: true,
              onTap: onButtonClicked,
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: onBottomLinkClicked,
              child: Text.rich(
                TextSpan(
                  text: bottomMessage,
                  style: kDescTextStyle,
                  children: <InlineSpan>[
                    WidgetSpan(
                        child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 10),
                    )),
                    TextSpan(
                      text: bottomMessageLink,
                      style: kDescTextStyle.copyWith(color: kAccentColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
