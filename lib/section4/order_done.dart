import 'package:flutter/material.dart';
import 'package:web/section5/track.dart';

import '../responsive.dart';
import '../section5/profile2.dart';
import '../train/cart_screen.dart';
import '../train/favorite.dart';
import '../train/home_screen.dart';

class Mm extends StatefulWidget {
  const Mm({super.key});

  @override
  State<Mm> createState() => _MmState();
}

class _MmState extends State<Mm> {


  int _currentindexed=0;

  // قائمة الصفحات التي سيتم عرضها عند الضغط على أيقونة من الـ Bottom Nav
  final List<Widget> _screens = [
    const Profile(),
    const Favorite(),
    const CartScreen(),
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            width: responsiveWidth(context, 35) ,
            height: responsiveHeight(context, 35) ,
            decoration: BoxDecoration(color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8)),
            child: Icon(Icons.notification_add_outlined),
          )
        ],
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
      ),
    body: Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
            Text("Cheackout",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
            SizedBox(height:responsiveHeight(context,10) ,),
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Image.asset("assets/images/celebration.png",height: 287,width: 430,),
              SizedBox(height: responsiveHeight(context,20) ,),
              Text(
                "Your Order Done Successfully",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700,color: Color(0xff263238)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: responsiveHeight(context, 10) ,),
              Text(
                "you will get your order within 12min.\nthanks for using our services",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Color(0xff263238)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height:responsiveHeight(context, 40) ,),
                Center(
                  child: SizedBox(
                    width: responsiveWidth(context, 327),
                    height: responsiveHeight(context, 57),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>  TrackPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 20,
                        shadowColor: Color(0xff25AE4B).withOpacity(0.8),
                        backgroundColor: Color(0xff25AE4B),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: responsiveWidth(context, 5) ,),
                          const Text(
                            'track Your Order',
                            style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ]) ],),
          ),
          )),
        ],
      ),
    ),
        floatingActionButton: Transform.translate(
          offset: Offset(0, 10), // نزلي الزر 10 بكسل لتحت
          child: Stack(
            alignment: Alignment.center,
            children: [
              // الدائرة الخلفية الفاتحة
              Container(
                width: responsiveWidth(context, 65) ,
                height:responsiveHeight(context, 65) ,
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
          height: responsiveHeight(context, 81) ,
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
                  icon: SizedBox(width: responsiveWidth(context, 15) ,), // هذه المسافة بين الأيقونة التالية
                  label: "", // إذا كانت فارغة
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.access_time_rounded, size: 30),
                  label: "History",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined, size: 30),
                  label: "Profile",
                ),

              ]),
        )
    );
  }
}
