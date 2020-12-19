import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome back, \n Sign in to continue',
                style: kTitleTextStyle.copyWith(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                label: 'Enter Email',
                textInputType: TextInputType.emailAddress,
                isPassword: false,
              ),
              CustomTextField(
                label: 'Enter Password',
                textInputType: TextInputType.visiblePassword,
                isPassword: true,
              ),
              const SizedBox(height: 40.0),
              GradientButton(
                context: context,
                label: 'Login',
                isCurved: true,
                onTap: () => print('Login'),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => print('sign up'),
                child: Text.rich(
                  TextSpan(
                    text: 'Don\'t have an account yet? ',
                    style: kDescTextStyle,
                    children: <InlineSpan>[
                      WidgetSpan(
                          child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 10),
                      )),
                      TextSpan(
                        text: ' Sign Up',
                        style: kDescTextStyle.copyWith(color: kAccentColor),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
