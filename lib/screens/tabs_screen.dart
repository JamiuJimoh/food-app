import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens/screens.dart';
import '../constants.dart';

class TabsScreen extends StatefulWidget {
  static const String id = 'tabs_screen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    MealsOverviewScreen(),
    FavoritesScreen(),
    OrdersScreen(),
    AccountScreen(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: kScaffoldColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text('Meals'),
          // ),

          // body: IndexedStack(
          //   index: _selectedPageIndex,
          //   children: _pages,
          // ),
          body: _pages[_selectedPageIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: kScaffoldColor,
            elevation: 10.0,
            unselectedItemColor: kBorderColor,
            selectedItemColor: kAccentColor,
            currentIndex: _selectedPageIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.search),
              //   label: 'Search',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
