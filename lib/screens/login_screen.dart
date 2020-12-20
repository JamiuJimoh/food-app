import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationWidget(
        titleMessage: 'Welcome back, \n Sign in to continue',
        label: 'Login',
        onButtonClicked: () => print('Sign Up'),
        customTextField: [
          CustomTextField(
            label: 'Enter Email',
            textInputType: TextInputType.emailAddress,
            isPasswordInputField: false,
          ),
          CustomTextField(
            label: 'Enter Password',
            textInputType: TextInputType.visiblePassword,
            isPasswordInputField: true,
          ),
        ],
        bottomMessage: 'Don\'t have an account yet? ',
        bottomMessageLink: ' Sign Up',
        onBottomLinkClicked: () {
          return Navigator.pushNamed(context, SignupScreen.id);
        },
      ),
    );
  }
}
