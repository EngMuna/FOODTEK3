import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web/responsive.dart';

import '../train/bottom_nav_bar.dart';
import '../train/cart_screen.dart';
import '../train/favorite.dart';
import '../train/home_screen.dart';
import '../section5/profile2.dart';
import 'card.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {

  final List<bool> _selectedPaymentMethod=[true,false];
  String _selectedPaymentType="Card";
  String _selectedCardType="MasterCard";
  int currentIndex=2;

  int _currentindexed=0;

  // قائمة الصفحات التي سيتم عرضها عند الضغط على أيقونة من الـ Bottom Nav
  final List<Widget> _screens = [
    const Profile(),
    const Favorite(),
    const CartScreen(),
  ];

  // الدالة التي سيتم استدعاؤها عند الضغط على أي أيقونة في الـ Bottom Navigation Bar
  void _onNavItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 340,top: 40),
                  width: responsiveWidth(context, 30),
                  height: responsiveHeight(context, 30),
                  decoration: BoxDecoration(color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(Icons.notification_add_outlined),
                ),
                SizedBox(height:responsiveHeight(context, 8) ,),
                Text("Cheackout",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                SizedBox(height:responsiveHeight(context, 10) ,),
                Text("Pay With",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),

                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.location_searching,
                  color:_selectedPaymentMethod[0]?Colors.green:Colors.grey ,),
                  title:Text("88 Zurab Gorgiladze St",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400)),
                  subtitle: Text("Georgia, Batumi",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color(0xffB8B8B8))),
                  onTap: (){
                    setState(() {
                      _selectedPaymentMethod[0]=!_selectedPaymentMethod[0];
                      _selectedPaymentMethod[1]=false;
                    });
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero, // إزالة التباعد الداخلي
                  title: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: _selectedPaymentMethod[1] ? Colors.green : Colors.grey,
                      ),
                      SizedBox(width: responsiveWidth(context, 8) ,), // مسافة صغيرة بين الأيقونة والعنوان
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "5 Noe Zhordania St",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Georgia, Batumi",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffB8B8B8),
                            ),
                          ),
                        ],
                      ),
                      Spacer(), // يدفع الزر إلى نهاية السطر
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "change",
                          style: TextStyle(color: Colors.green[700]),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      _selectedPaymentMethod[1] = !_selectedPaymentMethod[1];
                      _selectedPaymentMethod[0] = false;
                    });
                  },
                ),
                SizedBox(height: responsiveHeight(context,16) ,),

                Text("promo code?",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                SizedBox(height: responsiveHeight(context, 8) ,),
                Container(
                  height:responsiveHeight(context, 42) ,
                  width: responsiveWidth(context, 376) ,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade100)
                  ),
                  child: Row(
                    spacing: 10,
                    children: [
                      Expanded(child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10,),
                          hintText: "Enter Your Promo",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                      ),
                      SizedBox(height: responsiveHeight(context, 8) ,),
                      ElevatedButton(onPressed: (){Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Cardd()),);},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),// تغيير فقط الزاوية العلوية اليمنى
                                ),
                              ),
                            backgroundColor: Colors.green,
                          minimumSize: Size(90, 42)), child: Text("Add",
                          style: TextStyle(color: Colors.white),))
                    ],
                  ),
                ),
                SizedBox(height: responsiveHeight(context, 16) ,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("pay with",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    SizedBox(height: responsiveHeight(context, 10),),
                    Row(
                      children: [
                        Radio(
                          value: "Card",
                          groupValue: _selectedPaymentType,
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentType = value!;
                            });
                          },
                          activeColor: Colors.green,
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0), // يقلل المسافات الافتراضية
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // يقلل حجم منطقة الضغط
                        ),
                        Text("Card", style: TextStyle(fontSize: 14)),
                        SizedBox(width: responsiveWidth(context, 80),),
                        Radio(
                          value: "Cash",
                          groupValue: _selectedPaymentType,
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentType = value!;
                            });
                          },
                          activeColor: Colors.green,
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0), // يقلل المسافات الافتراضية
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // يقلل حجم منطقة الضغط
                        ),
                        Text("Cash", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  SizedBox(height: responsiveHeight(context, 20),),
                  Text("card type",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    SizedBox(height: responsiveHeight(context, 10),),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 130,
                          child: RadioListTile(
                            value: "MasterCard",
                            groupValue: _selectedCardType,
                            onChanged: (value) {
                              setState(() {
                                _selectedCardType = value!;
                              });
                            },
                            title: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "assets/images/Mastercard.png",
                                  width: responsiveWidth(context, 24) , // تحديد الحجم المطلوب للصورة
                                ),
                              ],
                            ),
                            activeColor: Colors.green,
                            visualDensity: VisualDensity(horizontal: -4.0, vertical: -2.0),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                        //SizedBox(width: 2), // مسافة قليلة جدًا بين العناصر
                        SizedBox(
                          width: responsiveWidth(context, 130) ,
                          child: RadioListTile(
                            value: "visa",
                            groupValue: _selectedCardType,
                            onChanged: (value) {
                              setState(() {
                                _selectedCardType = value!;
                              });
                            },
                            title: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "assets/images/Visa.png",
                                  width:responsiveWidth(context, 24) , // تحديد الحجم للصورة
                                ),
                              ],
                            ),
                            activeColor: Colors.green,
                            visualDensity: VisualDensity(horizontal: -4.0, vertical: -2.0),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          ),
                        ),
                      ],
                    )


                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: 206,
                  width:responsiveWidth(context,378) ,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Pattern.png'), // صورة من المجلد assets
                      fit: BoxFit.cover,),
                    color:Color(0xff25AE4B),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sub-Total",
                            style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                          Text("100\$",
                            style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                        ],
                      ),
                      SizedBox(height: responsiveHeight(context, 3) ,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery Charge",
                            style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                          Text("10\$",
                            style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                        ],
                      ),
                      SizedBox(height: responsiveHeight(context, 3) ,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("discount",
                            style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                          Text("10\$",
                            style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                        ],

                      ),
                      SizedBox(height: responsiveHeight(context, 3) ,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total:",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18),),
                          Text("110\$",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18),),
                        ],
                      ),
                      SizedBox(height: responsiveHeight(context, 20) ,),
                      SizedBox(
                          height: responsiveHeight(context, 57) ,
                          width: responsiveWidth(context, 366) ,
                          child: ElevatedButton(onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)
                              ),
                              padding: EdgeInsets.symmetric(vertical: 13),),
                            child: Text("Place My Order",
                              style: TextStyle(color: Colors.green,
                                  fontSize: 14,fontWeight: FontWeight.w700),
                            ),
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(height: responsiveHeight(context,16) ,)
              ],
            ),),
          ),
            floatingActionButton: Transform.translate(
              offset: Offset(0, 10), // نزلي الزر 10 بكسل لتحت
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // الدائرة الخلفية الفاتحة
                  Container(
                    width:responsiveWidth(context, 65) ,
                    height: responsiveHeight(context, 65) ,
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
              height: responsiveHeight(context, 81) ,
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
                      icon: SizedBox(width: responsiveWidth(context,15) ,), // هذه المسافة بين الأيقونة التالية
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
        )
    );
  }
}
