import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food delivery app',
      theme: AppTheme.primaryAppTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: MealsOverviewScreen.id,
      routes: {
        OnboardingScreen.id: (context) => OnboardingScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        MealsOverviewScreen.id: (context)=>MealsOverviewScreen(),
      },
    );
  }
}
