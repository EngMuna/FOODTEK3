

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60), // ارتفاع محدد للشريط العلوي
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Checkout",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Stack(
                children: [
                  Icon(Icons.notifications, color: Colors.black, size: 28),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 50,), // يترك المساحة العلوية فارغة بعد الـ AppBar
           Column(
              mainAxisSize: MainAxisSize.min, // يمنع الامتداد غير اللازم
              children: [
                Image.asset("assets/images/card.png",
                    height: 200),
                SizedBox(height: 20),
                Text(
                  "Your Order Done Successfully",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "you will get your order within 12min.\nthanks for using our services",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    "track Your Order",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),

          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.green.shade100,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black54,
            currentIndex: 2, // تحديد الأيقونة النشطة
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorites"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.location_on), label: "Track"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ],
      ),
    );
  }
}
