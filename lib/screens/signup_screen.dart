import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  static const String id = 'signup_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationWidget(
        titleMessage: 'Create Account',
        label: 'Sign Up',
        onButtonClicked: () => print('Login'),
        customTextField: [
          CustomTextField(
            label: 'Username',
            textInputType: TextInputType.text,
            isPasswordInputField: false,
          ),
          CustomTextField(
            label: 'Email',
            textInputType: TextInputType.emailAddress,
            isPasswordInputField: false,
          ),
          CustomTextField(
            label: 'Password',
            textInputType: TextInputType.visiblePassword,
            isPasswordInputField: true,
          ),
        ],
        bottomMessage: 'Already have an account? ',
        bottomMessageLink: ' Login',
        onBottomLinkClicked: () {
          return Navigator.pushNamed(context, LoginScreen.id);
        },
      ),
    );
  }
}
