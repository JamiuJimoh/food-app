import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../mixins/interactive_dialog_mixin.dart';
import '../providers/auth.dart';
import '../models/http_exception.dart';
import '../widgets/widgets.dart';
import '../constants.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const id = 'auth_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            // padding: EdgeInsets.only(
            //   bottom: MediaQuery.of(context).viewInsets.bottom,
            // ),
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                AuthForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> with InteractiveDialogMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  void _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        // Log user in
        await Provider.of<Auth>(context, listen: false)
            .signin(_authData['email'], _authData['password']);
      } else {
        // Sign user up
        await Provider.of<Auth>(context, listen: false)
            .signup(_authData['email'], _authData['password']);
      }
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed.';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'Email already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'Invalid email or password.';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'Password is too weak';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'User email not found';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid email or password';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'Oops, an error occured. Authentication failed.';
      _showErrorDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _showErrorDialog(String message) {
    errorDialog(context, () => Navigator.of(context).pop(), message);
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                label: 'E-mail',
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                isPasswordInputField: false,
                validator: (value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return 'Invalid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _authData['email'] = value;
                },
              ),
              CustomTextField(
                label: 'Password',
                controller: _passwordController,
                textInputType: TextInputType.visiblePassword,
                textInputAction: _authMode == AuthMode.Signup
                    ? TextInputAction.next
                    : TextInputAction.done,
                isPasswordInputField: true,
                onFieldSubmitted:
                    _authMode == AuthMode.Signup ? null : (_) => _submit(),
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 5) {
                    return 'Password is too short!';
                  }
                },
                onSaved: (value) {
                  _authData['password'] = value;
                },
              ),
              if (_authMode == AuthMode.Signup)
                CustomTextField(
                  label: 'Confirm Password',
                  isEnabled: _authMode == AuthMode.Signup,
                  maxLines: 1,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _submit(),
                  isPasswordInputField: true,
                  validator: _authMode == AuthMode.Signup
                      ? (value) {
                          if (value != _passwordController.text) {
                            return 'Password do not match!';
                          }
                        }
                      : null,
                ),
              const SizedBox(height: 20.0),
              GradientButton(
                context: context,
                label: _authMode == AuthMode.Signup ? 'Sign Up' : 'Login',
                onTap: _submit,
                isCurved: true,
              ),
              const SizedBox(height: 20.0),
              _isLoading
                  ? CircularProgressIndicator()
                  : GestureDetector(
                      onTap: _switchAuthMode,
                      child: Text.rich(
                        TextSpan(
                          text: _authMode == AuthMode.Signup
                              ? 'Already have an account? '
                              : 'Don\'t have an account yet? ',
                          style: kDescTextStyle,
                          children: <InlineSpan>[
                            WidgetSpan(
                                child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 10),
                            )),
                            TextSpan(
                              text: _authMode == AuthMode.Signup
                                  ? ' Login'
                                  : ' Sign Up',
                              style:
                                  kDescTextStyle.copyWith(color: kAccentColor),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
