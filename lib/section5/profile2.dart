import 'package:flutter/material.dart';
import 'package:web/section5/profile1.dart';
import '../section6/cart_home.dart';
import '../section6/history_empty.dart';
import '../section6/historyscreen.dart';
import '../section6/homepagee.dart';
import '../train/cart_screen.dart';
import '../train/favorite.dart';
import '../train/navigation.dart';
import '../train/home_screen.dart';
import '../responsive.dart';
import '../section4/order_done.dart';
import '../train/person.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController email= TextEditingController();
  int currentIndex=2;
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
          padding: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              SizedBox(height:  responsiveHeight(context, 8),),
              Row(
                children: [
                  SizedBox(width: responsiveWidth(context, 15),),
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(" profile", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
                ],
              ),
              SizedBox(height:  responsiveHeight(context, 8),),
              CircleAvatar(radius: 40, backgroundImage: AssetImage("assets/images/man2.png")),
              SizedBox(height:  responsiveHeight(context, 8)),
              Text('Ahmad Daboor', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('ahmad1709@gmail.com', style: TextStyle(color: Colors.grey)),
              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(10),
              height:416,
              width: 380,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // تأثير الظل
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 0.8,color: Color(0xffFFFFFF)),

              ),
              child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Username ",style: TextStyle(color: Color(0xff6C7278),fontWeight: FontWeight.w500,fontSize: 12),),
                    SizedBox(height:  responsiveHeight(context, 5),),
                    SizedBox(
                      width: responsiveWidth(context, 356),
                      height: responsiveHeight(context, 46),
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "Ahmad Daboor",
                          hintStyle: TextStyle(fontSize: 14,color: Color(0xff1A1C1E),fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300, width: responsiveWidth(context, 1)), // حواف فاتحة عند التفعيل
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300, width: responsiveWidth(context, 1)), // حواف فاتحة عند التفعيل
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300, width:responsiveWidth(context, 1)), // حواف فاتحة عند التركيز
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 10),),
                    Text("Email ",style: TextStyle(color: Color(0xff6C7278),fontWeight: FontWeight.w500,fontSize: 12),),
                    SizedBox(height:responsiveHeight(context, 5),),
                    SizedBox(
                      width: responsiveWidth(context,356),
                      height: responsiveHeight(context, 46),
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          constraints: BoxConstraints(minHeight: 30),
                          hintText: "Loisbecket@gmail.com",hintStyle: TextStyle(fontSize: 14,color: Color(0xff1A1C1E),fontWeight: FontWeight.w500),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300, width: 1), // حواف فاتحة
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade500, width: 1), // حواف عند التركيز
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 10),),
                    Text("Phone Number",style: TextStyle(color: Color(0xff6C7278),fontWeight: FontWeight.w500,fontSize: 12),),
                    SizedBox(height:responsiveHeight(context, 5),),
                    SizedBox(
                      width: responsiveWidth(context, 356),
                      height: responsiveHeight(context, 46),
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          constraints: BoxConstraints(minHeight: 30),
                          hintText: "0797653948",hintStyle: TextStyle(fontSize: 14,color: Color(0xff1A1C1E),fontWeight: FontWeight.w500),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300, width: 1), // حواف فاتحة
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade500, width: 1), // حواف عند التركيز
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 10),),
                    Text("Passwoed",style: TextStyle(color: Color(0xff6C7278),fontWeight: FontWeight.w500,fontSize: 12),),
                    SizedBox(height: responsiveHeight(context, 5),),
                    SizedBox(

                      width: responsiveWidth(context, 356),
                      height: responsiveHeight(context, 46),
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          constraints: BoxConstraints(minHeight: 30),
                          hintText: "******************",hintStyle: TextStyle(fontSize: 14,color: Color(0xff1A1C1E),fontWeight: FontWeight.w500),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300, width: 1), // حواف فاتحة
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade500, width: 1), // حواف عند التركيز
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:responsiveHeight(context, 10),),
                    Text("Address ",style: TextStyle(color: Color(0xff6C7278),fontWeight: FontWeight.w500,fontSize: 12),),
                    SizedBox(height: responsiveHeight(context, 5),),
                    SizedBox(
                      width: responsiveWidth(context,356),
                      height: responsiveHeight(context, 46),
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          constraints: BoxConstraints(minHeight: 30),
                          hintText: "123 Al-Madina Street, Abdali, A",hintStyle: TextStyle(fontSize: 14,color: Color(0xff1A1C1E),fontWeight: FontWeight.w500),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300, width: 1), // حواف فاتحة
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade500, width: 1), // حواف عند التركيز
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:responsiveHeight(context, 10),),

                  ],
                ),
              ),

                SizedBox(height: responsiveHeight(context, 30),),
              Center(
                child: SizedBox(
                  width: responsiveWidth(context,295),
                  height: responsiveHeight(context, 48),
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff25AE4B),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const Text(
                          'Update',
                          style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
               ],
          ),

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
              onPressed: () { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepagee()),
              );
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
          selectedItemColor: Color(0xff25AE4B),
          unselectedItemColor: Color(0xff484C52),
          selectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          currentIndex: _currentindexed,
          onTap: (index) {
            setState(() {
              _currentindexed = index;
            });

            if (index == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Prof()),
              );
            }; if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Historyscreen()),
              );
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Icon(Icons.home_outlined, size: 30),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border, size: 30),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(width: responsiveWidth(context, 15)),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time_rounded, size: 30),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined, size: 30),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
