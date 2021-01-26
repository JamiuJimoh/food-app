import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';
import 'providers/providers.dart';
import 'screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Meals(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Categories(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Food delivery app',
        theme: AppTheme.primaryAppTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: TabsScreen.id,
        routes: {
          TabsScreen.id: (context) => TabsScreen(),
          OnboardingScreen.id: (context) => OnboardingScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          MealsOverviewScreen.id: (context) => MealsOverviewScreen(),
          MealDetailScreen.id: (context) => MealDetailScreen(),
          SelectedCategoryScreen.id: (context) => SelectedCategoryScreen(),
          CartScreen.id: (context)=> CartScreen(),
        },
      ),
    );
  }
}
