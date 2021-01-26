import 'package:flutter/material.dart';

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
    ProfileScreen(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Meals'),
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
              icon: Icon(Icons.shopping_bag),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
