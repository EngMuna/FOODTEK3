import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'favorite.dart';
import 'cart_empty.dart';
import '../section6/history_empty.dart';
import 'home_screen.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  Map<String, String> titleSubtitleMap = {
    "current location": "Subtitle 1",
    "current location": "Subtitle 2",
    "current location": "Subtitle 3",
  };

  String? selectedTitle;
  String? selectedSubtitle;
  int currentIndex=2;
  List screens = [
    const Scaffold(),
    const Favorite(),
    HomeScreen(),
    const CartScreen(),
    const Scaffold(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // عدد التبويبات
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child:ListView(
                shrinkWrap: true, 
                children: [
                  ListTile(
                    dense: true,
                    leading: Image.asset("assets/images/Notif.png"),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffF5F5F5),
                          ),
                          child: Icon(Icons.notification_add_outlined),
                        ),
                      ],
                    ),
                  ),
                ],
              )

            ),
            TabBar(
              indicatorColor: Color(0xff25AE4B),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Color(0xff25AE4B),
              unselectedLabelColor: Color(0xff98A0B4),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.centerLeft,  // لجعل النص يبدأ من اليسار
                    child: Text("Cart", ),
                  ),
                )
,
                Tab(
                  child: Align(
                    alignment: Alignment.centerLeft,  // لجعل النص يبدأ من اليسار
                    child: Text("History"),
                  ),
                )
,
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CartEmpty(),
                  HistoryEmpty(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          setState(() {
            currentIndex=2;
          });
        },
          shape: CircleBorder(),
          backgroundColor:  Color(0xff25AE4B),
          child: Icon(Icons.card_travel, color: Color(0xffDBF4D1),size: 30,),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          elevation: 2,
          height: 81,
          color: Color(0xffDBF4D1),
          // shape: CircularNotchedRectangle(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
            [ IconButton(

              onPressed: (){
                setState(() {
                  currentIndex=0;
                });
              },
              icon: Icon(
                Icons.home,
                size: 30,
                color:currentIndex==0?Colors.yellowAccent:Colors.red,),
            ),
              IconButton(
                onPressed: (){
                  setState(() {
                    currentIndex=1;
                  });
                },
                icon: Icon(
                  Icons.favorite_border,
                  size: 30,
                  color:currentIndex==1?Colors.yellowAccent:Colors.red,),),
              SizedBox(width: 50),
              IconButton(
                onPressed: (){
                  setState(() {
                    currentIndex=3;
                  });
                },
                icon: Icon(
                  Icons.history,
                  size: 30,
                  color:currentIndex==3?Colors.yellowAccent:Colors.red,),),
              IconButton(
                onPressed: (){
                  setState(() {
                    currentIndex=4;
                  });
                },
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color:currentIndex==4?Colors.yellowAccent:Colors.red,),)]

            ,),
        ),
      ),
    );
  }
}
