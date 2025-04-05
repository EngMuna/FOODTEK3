import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../section5/profile1.dart';
import '../section6/historyscreen.dart';
import '../section6/homepagee.dart';
import '../train/favorite.dart';
import '../section6/cart_home.dart';
import '../section6/history_empty.dart';
import '../train/person.dart';
import '../responsive.dart';
import 'check_out.dart';
import 'search.dart';

class Location1 extends StatefulWidget {
  const Location1({super.key});

  @override
  State<Location1> createState() => _Location1State();
}

class _Location1State extends State<Location1> {
  final TextEditingController searchController = TextEditingController();
  int _currentindexed=0;

  final List<Widget> screens=[
    Person(),//profile
    Favorite(),
    HistoryEmpty(),
    Carthome(),
  ];

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.985934703432616,  35.900362288558114),
    zoom:14,
  );

  List<Marker> markers = [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(
        31.97916408023516,
        35.90044811924163,
      ),
    ),
    Marker(
      markerId: MarkerId("2"),
      position: LatLng(
        31.997072383462147,
        35.87246731641433,
      ),
    ),
    Marker(
      markerId: MarkerId("3"),
      position: LatLng(
        31.98935622617766,
        35.91692761047735,
      ),
    ),
    Marker(
      markerId: MarkerId("4"),
      position: LatLng(
        31.967223269409377,
        35.88637188714446,
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        alignment: Alignment.center,
        children: [
          Expanded(
      child: GoogleMap(
      myLocationButtonEnabled: true,
        myLocationEnabled: true,
        markers: markers.toSet(),
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    ),
          SearchScreen(),

          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // إضافة زوايا مستديرة للحدود
              ),
              width: responsiveWidth(context, 343) ,
              height: responsiveHeight(context, 154) ,
              padding: EdgeInsets.all(10),
              child: Column(

                children: [
                  SizedBox(height: responsiveHeight(context,18) ,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10), // تحريك النص لليسار أكثر
                      child: Text(
                        "your location",
                        style: TextStyle(fontSize: 12, color: Color(0xff878787)),
                      ),
                    ),
                  ),
                  SizedBox(height:responsiveHeight(context,5) ,),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Color(0xff4CAF50)),
                      Text(
                        "123 Al-Madina Street, Abdali, Amman, Jordan",
                        style: TextStyle(fontSize: 12, color: Color(0xff6C7278),fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: responsiveHeight(context,5) ,),
                  SizedBox(
                    height: responsiveHeight(context, 48) ,
                    width: responsiveWidth(context, 295) ,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => CheckOut()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 13),
                      ),
                      child: Text(
                        "Set Location",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],),

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
    )

  ;
  }
}

