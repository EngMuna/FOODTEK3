import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap, required List<Widget> screens,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Main content goes here"), // يمكنك تغيير هذا إلى أي محتوى تريد عرضه في الـ body.
      ),
      floatingActionButton: Transform.translate(
        offset: Offset(0, 10), // نزلي الزر 10 بكسل لتحت
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: Color(0xffDBF4D1),
                shape: BoxShape.circle,
                boxShadow: [],
              ),
            ),
            FloatingActionButton(
              elevation: 0,
              highlightElevation: 0,
              onPressed: () {
                print("FloatingActionButton Pressed");
              },
              shape: CircleBorder(),
              backgroundColor: Color(0xff25AE4B),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Color(0xffDBF4D1),
                size: 30,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 81,
        color: Color(0xffDBF4D1),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xffDBF4D1),
          selectedItemColor: Color(0xff25AE4B),
          unselectedItemColor: Color(0xff484C52),
          selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 24,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border, size: 24),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(width: 15), // لوضع مكان فارغ بين الأيقونات
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time_rounded, size: 24),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined, size: 24),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
