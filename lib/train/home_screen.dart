import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:web/section6/cart_home.dart';
import 'package:web/section6/history_empty.dart';

import 'package:web/train/person.dart';

import 'appbar.dart';
import 'favorite.dart';
import 'navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      appBar: AppBar(
        title: Text("data"),
      ),
     body: screens[_currentindexed],
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          _currentindexed=2;
        });},
        shape: CircleBorder(),
        backgroundColor:  Color(0xff25AE4B),
        child: Icon(Icons.card_travel, color: Color(0xffDBF4D1),size: 30,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Container(
        height: 81,
        color: Color(0xffDBF4D1),

        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xffDBF4D1),
            // لون الخلفية الأخضر
            selectedItemColor: Colors.red, // لون الأيقونات عند التحديد
            unselectedItemColor: Colors.red,
            elevation: 2,
          currentIndex: _currentindexed,
            onTap: (index){
            setState(() {
              _currentindexed=index;
            });
            },
            items:[
              BottomNavigationBarItem(
               icon: Icon(
                 Icons.person,
                 size: 30,),
              label: "Person"),
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

            ]),
      ),
    );
  }
}
