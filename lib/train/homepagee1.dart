import 'package:flutter/material.dart';
import 'package:web/train/person.dart';
import 'cart_screen.dart';
import 'favorite.dart';
import 'home_screen.dart';

class Homepagee1 extends StatefulWidget {
  const Homepagee1({super.key});

  @override
  State<Homepagee1> createState() => _Homepagee1State();
}

class _Homepagee1State extends State<Homepagee1> {
  int currentIndex = 2;
  final PageController _pageController = PageController(initialPage: 2);

  final List<Widget> screens = <Widget>[
    const Person(),
    const Favorite(),
    const HomeScreen(),
    const CartScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => currentIndex = index);
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => currentIndex = index),
        children: screens,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(2),
        shape: const CircleBorder(),
        backgroundColor: const Color(0xff25AE4B),
        child: const Icon(
          Icons.card_travel,
          color: Color(0xffDBF4D1),
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        height: 81,
        color: const Color(0xffDBF4D1),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => _onItemTapped(0),
              icon: Icon(
                Icons.person,
                size: 30,
                color: currentIndex == 0 ? Colors.yellowAccent : Colors.red,
              ),
            ),
            IconButton(
              onPressed: () => _onItemTapped(1),
              icon: Icon(
                Icons.favorite_border,
                size: 30,
                color: currentIndex == 1 ? Colors.yellowAccent : Colors.red,
              ),
            ),
            const SizedBox(width: 50),
            IconButton(
              onPressed: () => _onItemTapped(3),
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
                color: currentIndex == 3 ? Colors.yellowAccent : Colors.red,
              ),
            ),
            IconButton(
              onPressed: () => _onItemTapped(4),
              icon: Icon(
                Icons.more_horiz,
                size: 30,
                color: currentIndex == 4 ? Colors.yellowAccent : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}