import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../section6/cart_home.dart';
import '../section6/history_empty.dart';
import 'person.dart';
import 'bottom_nav_bar.dart';
import 'favorite.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Person(), // صفحة Profile
    Favorite(), // صفحة Favorite
    HistoryEmpty(), // صفحة History
    Carthome(), // صفحة Cart
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // عرض الصفحة بناءً على الـ Index
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavItemTapped,
        screens: _screens,
      ),
    );
  }
}
