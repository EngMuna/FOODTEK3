import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'favorite.dart';
import '../section6/cart_home.dart';
import '../section6/history_empty.dart';

class Person extends StatefulWidget {
  const Person({super.key});

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {

  String? selectedTitle;
  String? selectedSubtitle;
  Map<String, String> titleSubtitleMap = {
    "current location": "Subtitle 1",
    "current location": "Subtitle 2",
    "current location": "Subtitle 3",
  };

  int _currentIndex = 0;

  // قائمة الصفحات
  final List<Widget> screens = [
    Person(), // صفحة الـ Profile
    Favorite(), // صفحة الـ Favorite
    HistoryEmpty(), // صفحة الـ History
    Carthome(), // صفحة الـ Cart
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index; // تحديث الـ index عند الضغط على الـ BottomNav
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 750),
        child: Row(
        mainAxisSize: MainAxisSize.min,
          children: [ SizedBox(width: 10,),
           Container(
             width: 40,
             height: 40,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(8),
               color: Color(0xffF5F5F5),
             ),
             child:  Image.asset("assets/images/Notif.png"),
           ),
            SizedBox(width: 4,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, // ضبط العناصر في المنتصف
              children: [
                DropdownButton<String>(
                  hint: Text("Select Title",style: TextStyle(fontSize: 12, color: Color(0xff606060),fontWeight: FontWeight.w400),), // نص افتراضي عند عدم الاختيار
                  value: selectedTitle,
                  items: titleSubtitleMap.keys.map((String title) {
                    return DropdownMenuItem<String>(
                      value: title,
                      child: Text(title),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTitle = newValue;
                      selectedSubtitle = titleSubtitleMap[newValue]; // تحديث subtitle تلقائياً
                    });
                  },
                ),
                Text(
                  selectedSubtitle ?? "Jl. Soekarno Hatta 15A Malang...",
                  style: TextStyle(fontSize: 14, color: Color(0xff101010),fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(width: 65,),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffF5F5F5),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.notifications_none,
                    color: Color(0xff101010), // لون الجرس
                    size: 20,
                  ),
                  Positioned(
                    top: 8,
                    right: 12,
                    child: Container(
                      width: 6,
                      height: 7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red, // لون النقطة الحمراء
                      ),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
