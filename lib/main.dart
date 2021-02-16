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
            auth.userId,
            previousMeals == null ? [] : previousMeals.items,
          ),
          create: null,
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (ctx, auth, previousOrders) => Orders(
            auth.token,
            auth.userId,
            previousOrders == null ? [] : previousOrders.orders,
          ),
          create: null,
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'MatLyan',
          theme: AppTheme.primaryAppTheme,
          debugShowCheckedModeBanner: false,
          // initialRoute: OnboardingScreen.id,
          home: auth.isAuth //Are we authenticated?
              ? TabsScreen() //if yes, show tabs screen.
              : FutureBuilder(
                  //if not, futurebuilder
                  future: auth.tryAutoLogin(), //try autologin
                  builder: (ctx, authResultSnapshot) => authResultSnapshot
                              .connectionState ==
                          ConnectionState.waiting
                      ? SplashScreen() //while waiting for result, show splashScreen
                      : OnboardingScreen(), //if done waiting, show this screen
                ),
          routes: {
            OnboardingScreen.id: (context) => OnboardingScreen(),
            TabsScreen.id: (context) => TabsScreen(),
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
