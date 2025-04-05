import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'favorite.dart';
import 'home_screen.dart';


class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}
class _NavigationState extends State<Navigation> {
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          currentIndex=2;
        });
      },
        shape: CircleBorder(),
        backgroundColor: Colors.yellow,
        child: Icon(Icons.card_travel,color: Colors.black,size: 30,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        height: 81,
        color: Colors.green,
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
              color:currentIndex==0?Colors.yellowAccent:Colors.red,),),
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
      body: screens[currentIndex],
    );
  }
}
