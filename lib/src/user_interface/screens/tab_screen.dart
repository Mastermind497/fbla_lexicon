import 'package:flutter/material.dart';

import 'review_screen.dart';
import 'welcome_screen.dart';

class TabScreen extends StatefulWidget {
  static const route = '/home';
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _pages = [
    WelcomeScreen(),
    ReviewScreen(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FBLA Lexicon'),
        automaticallyImplyLeading: false,
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Play Quiz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Review',
            ),
          ]),
    );
  }
}
