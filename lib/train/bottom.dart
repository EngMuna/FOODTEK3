import 'package:flutter/material.dart';
import '../section6/cart_home.dart';
import '../section6/history_empty.dart';
import 'person.dart';
import '../section4/check_out.dart';
import 'favorite.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _currentIndexed = 0;

  final List<Widget> screens = [
    Person(),  // الصفحة الشخصية
    Favorite(), // المفضلة
    HistoryEmpty(), // التاريخ
    Carthome(),
    CheckOut(),// السلة
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( // يحافظ على حالة الصفحات عند التنقل
        index: _currentIndexed,
        children: screens,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentIndexed = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0xff25AE4B),
        child: const Icon(Icons.card_travel, color: Color(0xffDBF4D1), size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xffDBF4D1),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black54,
        elevation: 2,
        currentIndex: _currentIndexed,
        onTap: (index) {  // تحديث الصفحة عند النقر
          setState(() {
            _currentIndexed = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: "Person",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 30),
            label: "Favorite",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history, size: 30),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 30),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
