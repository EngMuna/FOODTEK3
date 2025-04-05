import 'package:flutter/material.dart';
import 'package:web/responsive.dart';

import '../train/cart_screen.dart';
import '../train/favorite.dart';
import '../train/navigation.dart';
import '../section6/cart_home.dart';
import '../section6/history_empty.dart';
import '../train/home_screen.dart';
import '../train/person.dart';
import 'order_done.dart';

class Cardd extends StatefulWidget {
  const Cardd({super.key});

  @override
  State<Cardd> createState() => _CarddState();
}

class _CarddState extends State<Cardd> {
  int _currentindexed=0;

  final List<Widget> screens=[
    Person(),//profile
    Favorite(),
    HistoryEmpty(),
    Carthome(),

  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr,
    child: Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
    actions: [
    Container(
    margin: EdgeInsets.all(10),
    width: responsiveWidth(context, 35),
    height: responsiveHeight(context, 35),
    decoration: BoxDecoration(color: Colors.grey.shade100,
    borderRadius: BorderRadius.circular(8)),
    child: Icon(Icons.notification_add_outlined),
    )
    ],
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    elevation: 0,
    ),
    body: SingleChildScrollView(
    child: Padding(padding: EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text("Add Card",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
    SizedBox(height: 20,),
      Image.asset("assets/images/card.png"),
      SizedBox(height: 5,),
      Text(" Name ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400)),
      SizedBox(height: 5,),
      SizedBox(
        width: responsiveWidth(context, 368),
        height: responsiveHeight(context, 40),
        child: TextField(
          decoration: InputDecoration(
            isDense: true,
            constraints: BoxConstraints(minHeight: 30),
            hintText: "Raya Daboor",hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xff1A1C1E)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300, width: responsiveWidth(context, 1),), // حواف فاتحة
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade500, width: responsiveWidth(context, 1),), // حواف عند التركيز
            ),
          ),
        ),
      ),

      SizedBox(height: responsiveHeight(context, 12),),
      Text("Card Number ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400)),
      SizedBox(height: responsiveHeight(context, 5),),
      SizedBox(
        width: responsiveWidth(context, 368),
        height: responsiveHeight(context, 40),
        child: TextField(
          decoration: InputDecoration(
            isDense: true,
            hintText: "6578 8756 4238 92764",
            hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xff1A1C1E)),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(6.0),  // لضبط المسافة حول الأيقونة
              child: Image.asset(
                "assets/images/shopping_15402438 1.png",
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1), // حواف فاتحة عند التفعيل
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1), // حواف فاتحة عند التفعيل
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1), // حواف فاتحة عند التركيز
            ),
          ),
        ),
      ),



      SizedBox(height: responsiveHeight(context, 12),),
      Row(mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Text(" Expire",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xff6C7278))),
          SizedBox(width:140,),
          Text("CVC",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xff6C7278)))
        ],
      ),
      SizedBox(height: responsiveHeight(context, 5),),
      Row(
   // يحدد المسافة بين العناصر
        children: [
          // الحقل الأول
          SizedBox(
            width: responsiveWidth(context, 176),
            height: responsiveHeight(context, 46),
            child: TextField(
              textAlign: TextAlign.center,  // لضبط النص في المنتصف أفقيًا
              decoration: InputDecoration(
                isDense: true,
                hintText: "04/23",
                hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xff1A1C1E)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1), // حواف فاتحة
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: BorderSide(color: Colors.grey.shade500, width: 1), // تغيير لون الحواف عند التركيز
                ),
              ),
            ),
          ),

          SizedBox(width:responsiveWidth(context, 12),), // المسافة بين الحقول
          // الحقل الثاني
          SizedBox(
            width: responsiveWidth(context, 176),
            height: responsiveHeight(context, 46),
            child: TextField(
              textAlign: TextAlign.center,  // لضبط النص في المنتصف أفقيًا
              decoration: InputDecoration(
                isDense: true,
                hintText: "875",
                hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xff1A1C1E)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1), // حواف فاتحة
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: BorderSide(color: Colors.grey.shade500, width: 1), // تغيير لون الحواف عند التركيز
                ),
              ),
            ),
          ),


        ],
      ),
      SizedBox(height: responsiveHeight(context, 15),),
      Center(
        child: Text(
          "you will get your order within 12min.\nthanks for using our services",
          style: TextStyle(fontSize: 13, color: Colors.grey,fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(height:responsiveHeight(context, 25),),
      Center(
        child: SizedBox(
          width: responsiveWidth(context, 327),
          height: responsiveHeight(context, 57),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>  Mm()),
              );
            },
            style: ElevatedButton.styleFrom(
              elevation: 20,
              shadowColor: Color(0xff25AE4B).withOpacity(0.8),
              backgroundColor: Color(0xff25AE4B),
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock,size: 25,color: Colors.white,),
                SizedBox(width: responsiveWidth(context, 5),),
                const Text(
                  'Pay for the order',
                  style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    ]
    )
    ),
    ),
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
          height: 81,
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
                  icon: SizedBox(width: responsiveWidth(context, 15),), // هذه المسافة بين الأيقونة التالية
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
    ),
    );

  }
}
