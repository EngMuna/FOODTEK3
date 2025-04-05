import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'favorite.dart';
import 'home_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex=2;

  List screens = [
  const Scaffold(),
  const Favorite(),
  HomeScreen(),
  const CartScreen(),
  const Scaffold(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height:30,),
              Row(children: [ IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
                Text("profile",style: TextStyle(fontSize: 20,color: Color(0xff391713),fontWeight: FontWeight.w600),),],),
              SizedBox(height:4,),
              CircleAvatar(radius: 40, backgroundImage: AssetImage("assets/images/man2.png")),
              SizedBox(height: 7),
              Text('Ahmad Daboor', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('ahmad1709@gmail.com', style: TextStyle(color: Colors.grey)),
              SizedBox(height: 20),

              _buildSection([
                Align(
                  alignment: Alignment.centerLeft, // يضع النص في أقصى اليسار
                  child: Text(
                    "My Account", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),

                _buildButton(Icons.person, 'Personal information', () {}),
                _buildButton(Icons.language, 'Language', () {}),
                _buildButton(Icons.privacy_tip, 'Privacy Policy', () {}),
                _buildButton(Icons.settings, 'Setting', () {}),
              ]),
              SizedBox(height: 10),
              _buildSection([
                Align(
                  alignment: Alignment.centerLeft, // يضع النص في أقصى اليسار
                  child: Text(
                    "Notfication", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                _buildSwitchButton(Icons.notifications, 'Push Notifications', true, (value) {}),
                _buildSwitchButton(Icons.campaign, 'Promotional Notifications', false, (value) {}),
              ]),
              SizedBox(height: 10),
              _buildSection([
                Align(
                  alignment: Alignment.centerLeft, // يضع النص في أقصى اليسار
                  child: Text(
                    "More", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                _buildButton(Icons.help, 'Help Center', () {}),
                _buildButton(Icons.logout, 'Log Out', () {}, color: Colors.red),
              ]),
            ],
          ),
        ),
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
    );
  }

  Widget _buildSection(List<Widget> children) {
    return Container(
      height: 191,
      width: 380,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildButton(IconData icon, String text, VoidCallback onTap, {Color color = Colors.black}) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.centerLeft,
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 10),
          Text(text, style: TextStyle(fontSize: 10, color: color)),
        ],
      ),
    );
  }

  Widget _buildSwitchButton(IconData icon, String text, bool value, ValueChanged<bool> onChanged) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      trailing: Switch(value: value, onChanged: onChanged),
    );
  }
}