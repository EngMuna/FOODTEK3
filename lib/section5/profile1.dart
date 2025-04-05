import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web/section5/profile2.dart';

import '../section6/cart_home.dart';
import '../section6/history_empty.dart';

import '../responsive.dart';
import '../train/favorite.dart';
import '../train/person.dart';

class Prof extends StatefulWidget {
  const Prof({super.key});

  @override
  State<Prof> createState() => _ProfState();
}

class _ProfState extends State<Prof> {
  int _currentindexed=0;

  final List<Widget> screens=[
    Person(),//profile
    Favorite(),
    HistoryEmpty(),
    Carthome(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
          body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height:20,),
          Row(children: [ IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
            Text("profile",style: TextStyle(fontSize: 20,color: Color(0xff391713),fontWeight: FontWeight.w600),),],),
          //SizedBox(height: responsiveWidth(context, 4),),

          Center(
            child: Column(
            children: [
            CircleAvatar(radius: 40, backgroundImage: AssetImage("assets/images/man2.png")),
            SizedBox(height: responsiveWidth(context, 7),),
            Text('Ahmad Daboor', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('ahmad1709@gmail.com', style: TextStyle(color: Colors.grey)),
            SizedBox(height:responsiveWidth(context, 10)),
             Container(
               width:responsiveWidth(context, 380), // عرض الـ Container
               height: responsiveHeight(context,196), // ارتفاع الـ Container
               padding: EdgeInsets.all(10), // إضافة بعض المسافة الداخلية
               decoration: BoxDecoration(
                 color: Colors.white, // لون الخلفية
                 borderRadius: BorderRadius.circular(10), // زوايا دائرية
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.2),
                     spreadRadius: 1,
                     blurRadius: 7,
                     offset: Offset(0, 3), // تأثير الظل
                   ),
                 ],
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("My Account",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                   SizedBox(height:responsiveWidth(context, 12),),
                   GestureDetector(
                     onTap: (){Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Profile()),
                     );},
                     child: Row(
                       children: [
                         Icon(Icons.person_add_alt_1_sharp,size: 20,),
                         SizedBox(width:responsiveWidth(context, 10),),
                         Text("Personal information",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                       ],
                     ),
                   ),
                   SizedBox(height: responsiveHeight(context, 10),),
                   GestureDetector(
                     onTap: (){},
                     child: Row(
                       children: [
                         Icon(Icons.language,size: 20,),
                         SizedBox(width: responsiveHeight(context, 10),),
                         Text("Language",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500) ),
                         SizedBox(width: 190),
                         Text("عربيه")
                       ],
                     ),
                   ),
                   SizedBox(height: responsiveHeight(context, 11),),
                   GestureDetector(
                     onTap: (){},
                     child: Row(
                       children: [
                         Icon(Icons.privacy_tip,size: 20,),
                         SizedBox(width: responsiveWidth(context, 10),),
                         Text("Privacy Policy",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                       ],
                     ),
                   ),
                   SizedBox(height: responsiveHeight(context, 11),),
                   GestureDetector(
                     onTap: (){},
                     child: Row(
                       children: [
                         Icon(Icons.settings,size: 20,),
                         SizedBox(width: responsiveWidth(context, 10),),
                         Text("Setting",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
              SizedBox(height: responsiveHeight(context, 15),),
          Container(
          width: responsiveWidth(context, 380),  // عرض الـ Container
          height: responsiveWidth(context, 144),// ارتفاع الـ Container
          padding: EdgeInsets.all(10), // إضافة بعض المسافة الداخلية
          decoration: BoxDecoration(
          color: Colors.white, // لون الخلفية
          borderRadius: BorderRadius.circular(10), // زوايا دائرية
          boxShadow: [
          BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 7,
          offset: Offset(0, 3), // تأثير الظل
          ),
          ],
          ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Notifications",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
          SizedBox(height:responsiveWidth(context, 5)),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildRow("Push Notifications", true, context),
                buildRow("Promotional Notifications", false, context),
              ],
            )
          ]
            ),
          ),
           SizedBox(height:responsiveHeight(context, 15)),
            Container(
            width: responsiveWidth(context,380),  // عرض الـ Container
          height: responsiveHeight(context, 140), // ارتفاع الـ Container
          padding: EdgeInsets.all(10), // إضافة بعض المسافة الداخلية
          decoration: BoxDecoration(
          color: Colors.white, // لون الخلفية
          borderRadius: BorderRadius.circular(10), // زوايا دائرية
          boxShadow: [
          BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 7,
          offset: Offset(0, 3), // تأثير الظل
          ),
          ],
          ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("More",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
          SizedBox(height: responsiveHeight(context,5)),
          GestureDetector(
          onTap: (){},
          child: Row(
          children: [
          Icon(Icons.help_outline),
          SizedBox(width: responsiveWidth(context,10)),
          Text("Help Center",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
          ],
          ),
          ),
          //SizedBox(height:responsiveWidth(context,3),),
          GestureDetector(
          onTap: (){},
          child: Row(
          children: [
          Icon(Icons.logout,color: Color(0xffDC1010),),
         // SizedBox(width: responsiveWidth(context,11)),
          TextButton(onPressed: (){}, child:Text("Log Out",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xffDC1010))))
          ],
          ),
          ),
      
            ]  ),
              ),
          ])),
        ],
      ))
          ),
        floatingActionButton: Transform.translate(
          offset: Offset(0, 10), // نزلي الزر 10 بكسل لتحت
          child: Stack(
            alignment: Alignment.center,
            children: [
              // الدائرة الخلفية الفاتحة
              Container(
                width:responsiveWidth(context, 65),
                height:responsiveHeight(context, 65),
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
          height: responsiveHeight(context, 81),
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
                  icon: Icon(Icons.edit_location,color: Color(0xff23AA49), size: 30),
                  label: "Track",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined, size: 30),
                  label: "Profile",
                ),

              ]),
        )
    );
  }
  Widget buildRow(String title, bool isActive, BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.notifications_none_outlined),
              SizedBox(width: responsiveWidth(context, 10)),
              Text(title),
            ],
          ),
          Transform.scale(
            scale: 0.8, // لتصغير حجم الـ switch
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ),
          ),
        ],

    );
  }

  }
