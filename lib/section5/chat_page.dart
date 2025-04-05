import 'package:flutter/material.dart';


import '../train/favorite.dart';
import '../section6/cart_home.dart';
import '../section6/history_empty.dart';
import '../train/person.dart';
import '../responsive.dart';
import 'chat_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
      backgroundColor: Colors.white,
      body:
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: responsiveWidth(context, 24),
                right: responsiveWidth(context, 24),
                top: responsiveHeight(context, 25),
              ),
              child: Column(
                children: [
                  SizedBox(height:35,),
                  Row(children: [ IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                    Text("Chat",style: TextStyle(fontSize: 20,color: Color(0xff391713),fontWeight: FontWeight.w600),),],),
                  PreferredSize(
                    preferredSize: Size.fromHeight(1), // ارتفاع الخط (1 بيكسل)
                    child: Container(
                      color: Color(0xffECECEC), // لون الخط
                      height: responsiveHeight(context,1), // سمك الخط
                    ),
                  ),
                  Expanded(
                    child: ChatViewWidget(
                  messages:
                  [
                   " Hello chatGPT,how are you today?",
                    "There are many programming languages \n​​in the market that are used in designing \n and building websites, various\n applications and other tasks. All these \n languages ​​are popular in their place and \n in the way they are used, and many \n programmers learn and use them.",
                    "So explain to me more",
                  "There are many programming languages \n​​in the market that are used in designing \n and building websites, various\n applications and other tasks. All these \n languages ​​are popular in their place and \n in the way they are used, and many \n programmers learn and use them.",
                    "What is the best programming language?","Hello,i’m fine,how can i help you?",
                    "Hello chatGPT,how are you today?"],
                    ))],
              ),
            ),
            Positioned(
              bottom: 30,
              left: responsiveWidth(context, 30),
              right: responsiveWidth(context, 24),
              child: Container(
                width:responsiveWidth(context, 333),
                height: responsiveHeight(context,56),
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Write your message",
                          hintStyle: TextStyle(color: Color(0xffA1A1A1)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: Color(0xff25AE4B)),
                      onPressed: () {
                        // يمكنك هنا إضافة الكود لإرسال الرسالة
                      },
                    ),
                  ],
                ),
              ),
            ),],

      ),
        floatingActionButton: Transform.translate(
          offset: Offset(0, 10), // نزلي الزر 10 بكسل لتحت
          child: Stack(
            alignment: Alignment.center,
            children: [
              // الدائرة الخلفية الفاتحة
              Container(
                width: 65,
                height: 65,
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
                  icon: Icon(Icons.access_time_rounded, size: 30),
                  label: "History",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined, size: 30),
                  label: "Profile",
                ),

              ]),
    ));
  }
}