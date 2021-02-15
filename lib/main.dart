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
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Meals>(
          update: (ctx, auth, previousMeals) => Meals(
            auth.token,
            previousMeals == null ? [] : previousMeals.items,
          ),
          create: null,
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'MatLyan',
          theme: AppTheme.primaryAppTheme,
          debugShowCheckedModeBanner: false,
          home: auth.isAuth ? TabsScreen() : AuthScreen(),
          routes: {
            TabsScreen.id: (context) => TabsScreen(),
            OnboardingScreen.id: (context) => OnboardingScreen(),
            AuthScreen.id: (context) => AuthScreen(),
            MealsOverviewScreen.id: (context) => MealsOverviewScreen(),
            MealDetailScreen.id: (context) => MealDetailScreen(),
            CartScreen.id: (context) => CartScreen(),
            OrdersScreen.id: (context) => OrdersScreen(),
            UserShopScreen.id: (context) => UserShopScreen(),
            EditUserMealScreen.id: (context) => EditUserMealScreen(),
          },
        ),
      ),
    );
  }
}
