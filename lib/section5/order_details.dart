// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:web/train/profile1.dart';

import '../train/cart_screen.dart';
import '../train/favorite.dart';
import '../section6/cart_home.dart';
import '../section6/history_empty.dart';
import '../train/home_screen.dart';
import '../train/person.dart';
import '../responsive.dart';
import 'alexander.dart';
import 'track.dart';
import 'statuss.dart';


class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  int _currentindexed=0;

  final List<Widget> screens=[
    Person(),//profile
    Favorite(),
    HistoryEmpty(),
    Carthome(),

  ];
  final List<String> statuses = [
    "Order received",
    "Cooking your order",
    "Courier is picking up order",
    "Order delivered"
  ];

  final List<IconData> icons = [
    Icons.check, // أيقونة طلب تم استلامه
    Icons.call_to_action_outlined, // أيقونة الطبخ
    Icons.person, // أيقونة التوصيل
    Icons.home, // أيقونة تم التوصيل
  ];

  final int currentStatus = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body:SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    SizedBox(height: responsiveHeight(context, 30),),
    Row(
    children: [
    IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
    Navigator.pop(context);
    },
    ),
    Text(
    "Order Details",
    style: TextStyle(
    fontSize: 20,
    color: Color(0xff391713),
    fontWeight: FontWeight.w600,
    ),
    ),
    ],
    ),
    SizedBox(height: 10),
    Row(
    children: [
    Image.asset("assets/images/bag.png", width: 44, height: 44),
    SizedBox(width: 10),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Order ID',
    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    ),
    Text('#8979-4532'),
    Text('25m'),
    ],
    ),
    ],
    ),
    //SizedBox(height: 20),

    // المراحل بدون Expanded
    ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: statuses.length,
    itemBuilder: (context, index) {
    return TimelineTile(
    isActive: index <= currentStatus,
    text: statuses[index],
    icon: icons[index],
    );
    },
    ),
    SizedBox(height: responsiveHeight(context, 20),),

    // معلومات السائق
    Alexander(),
    SizedBox(height: responsiveHeight(context, 10),),

    Container(
    height:  responsiveHeight(context, 1),
    width:  responsiveWidth(context, 440),
    color: Color(0xffF5F5F5),
    ),
    SizedBox(height: responsiveHeight(context, 50),),

    Center(
    child: SizedBox(
    width: responsiveWidth(context, 295),
    height: responsiveHeight(context, 48),
    child: ElevatedButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TrackPage()),
    );
    },
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    ),
    child: Text(
    "Live Track",
    style: TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w500),
    ),
    ),
    ),
    ),
    SizedBox(height:responsiveHeight(context, 20),),
    ],
    ),
    ),
    ),


    // شريط التنقل السفلي

        floatingActionButton: Transform.translate(
          offset: Offset(0, 10), // نزلي الزر 10 بكسل لتحت
          child: Stack(
            alignment: Alignment.center,
            children: [
              // الدائرة الخلفية الفاتحة
              Container(
                width: responsiveWidth(context, 65),
                height: responsiveHeight(context, 65),
                decoration: BoxDecoration(
                  color: Color(0xffDBF4D1),
                  shape: BoxShape.circle,
                  boxShadow: [], // بدون ظل
                ),
              ),
              // الزر الرئيسي
              FloatingActionButton(
                elevation: 0,
                highlightElevation: 0,
                onPressed: () {
                  setState(() {
                    _currentindexed = 2;
                  });
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
          height:responsiveHeight(context, 81),
          color: Color(0xffDBF4D1),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xffDBF4D1),
              // لون الخلفية الأخضر
              selectedItemColor: Color(0xff25AE4B), // لون الأيقونات عند التحديد
              unselectedItemColor: Color(0xff484C52),
              selectedLabelStyle: TextStyle(fontSize:15, fontWeight: FontWeight.w400),

              currentIndex: _currentindexed,

              items:[
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Icon(
                        Icons.home_outlined,
                        size: 30,),
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border, size:30),
                  label: "Favorite",

                ),
                BottomNavigationBarItem(
                  icon: SizedBox(width: 15), // هذه المسافة بين الأيقونة التالية
                  label: "", // إذا كانت فارغة
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.edit_location,color: Color(0xff23AA49), size: 30),
                  label: "Track",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined, size: 30),
                  label: "Profile",
                ),

              ]),
        ));
  }

  // عنصر واجهة المستخدم لعرض كل مرحلة من مراحل الطلب
  Widget _buildOrderStep(IconData icon, String title, bool isCompleted) {
    return ListTile(
      leading: Icon(icon, color: isCompleted ? Colors.green : Colors.grey),
      title: Text(
        title,
        style: TextStyle(
          color: isCompleted ? Colors.black : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
