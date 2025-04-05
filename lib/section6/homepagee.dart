import 'package:flutter/material.dart';
import 'package:web/train/person.dart';
import 'package:web/section5/track.dart';

import '../responsive.dart';
import '../section5/profile1.dart';
import '../train/cart_screen.dart';
import '../train/favorite.dart';
import '../train/cart_empty.dart';
import 'cart_home.dart';
import 'history_empty.dart';
import 'historyscreen.dart';
import '../train/home_screen.dart';

class Homepagee extends StatefulWidget {
  @override
  _HomepageeState createState() => _HomepageeState();
}

class _HomepageeState extends State<Homepagee> {
  Map<String, String> titleSubtitleMap = {
    "current location": "Subtitle 1",
    "current location": "Subtitle 2",
    "current location": "Subtitle 3",
  };

  String? selectedTitle;
  String? selectedSubtitle;
  int _currentindexed=0;
  final List<Widget> screens=[
    Person(),//profile
    Favorite(),
    HistoryEmpty(),
    Carthome(),


  ];
  int currentIndex = 2;
  final PageController _pageController = PageController(initialPage: 2);

  void _onItemTapped (int index) {
    setState(() => currentIndex = index);
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // عدد التبويبات
      child: Scaffold(
        backgroundColor: Colors.white,
        body:
        Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height:  responsiveHeight(context, 10), // حدد الارتفاع الذي تريده هنا
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) => setState(() => currentIndex = index),
                children: screens,
              ),
            ),

            Padding(
                padding: const EdgeInsets.only(bottom:0),
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
                            width:  responsiveWidth(context, 34),
                            height:  responsiveHeight(context, 34),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xffF5F5F5),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.notifications_none,
                                  color: Color(0xff101010), // لون الجرس
                                  size: 18,
                                ),
                                Positioned(
                                  top: 8,
                                  right: 10,
                                  child: Container(
                                    width:  responsiveWidth(context, 6),
                                    height:  responsiveHeight(context, 7),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red, // لون النقطة الحمراء
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
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
                  Carthome(),
                  Historyscreen(),

                ],
              ),
            ),
          ],
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
              };
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
      ),
    );
  }
}