import 'package:flutter/material.dart';
import 'package:web/responsive.dart';

import 'homepagee.dart';

class Carthome extends StatefulWidget {
  Carthome({super.key});

  @override
  _CarthomeState createState() => _CarthomeState();
}

class _CarthomeState extends State<Carthome> {
  List<String> images = [
    "assets/images/burger.png",
    "assets/images/pizaa.png",
    "assets/images/shawerma.png",
    "assets/images/shawerma.png",
  ];

  List<String> productTitle = [
    "Chicken Burger",
    "Onion Pizza",
    "Spicy Shawarma",
    "Spicy Shawarma"
  ];

  List<String> prices = [
    "\$20",
    "\$15",
    "\$15",
    "\$15"
  ];

  List<String> subTitle = [
    "Burger Factory LTD",
    "Pizza Palace",
    "Hot Cool Spot",
    "Hot Cool Spot"
  ];

  List<int> quantities = [1, 1, 1,1]; // ✅ قائمة لحفظ عدد الكميات لكل منتج

  void increaseQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index]--;
      }
    });
  }

  List<String> item = ['Current location', 'item1', 'item2', 'item3'];
  String? selectedItem = "Current location"; // قيمة العنصر المحدد

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
        body:
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 50,right: 20,left: 20,top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: Container(
                            height: 600, // ✅ تحديد ارتفاع للـ ListView.builder حتى يظهر
                            child:
                                images.isNotEmpty?
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: ListView.builder(
                                itemCount: images.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Dismissible(
                                    key: Key(images[index]), // تعيين مفتاح فريد لكل عنصر
                                    direction: DismissDirection.endToStart, // السحب من اليمين لليسار
                                    onDismissed: (direction) {
                                      // إزالة العنصر من القائمة بعد السحب
                                      setState(() {
                                        images.removeAt(index);
                                        productTitle.removeAt(index);
                                        prices.removeAt(index);
                                        subTitle.removeAt(index);
                                        quantities.removeAt(index);
                                      });
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text("Item removed from train"),
                                      ));
                                    },
                                    background: Container(
                                      color: Colors.orange,
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.delete_outline_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: Container(
                                      width:responsiveWidth(context, 387) ,
                                      height: responsiveHeight(context, 103),
                                      margin: EdgeInsets.symmetric(vertical: 10),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.green.withOpacity(0.2),
                                            blurRadius: 5,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(7),
                                            child: Image.asset(
                                              images[index],
                                              height:responsiveHeight(context, 62),
                                              width:responsiveWidth(context,62),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                productTitle[index],
                                                style: TextStyle(
                                                    color: Color(0xff000000),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(height: responsiveHeight(context, 1)),
                                              Text(
                                                subTitle[index],
                                                style: TextStyle(
                                                    color: Color(0xff3B3B3B),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12),
                                              ),
                                              SizedBox(height:responsiveHeight(context, 5)),
                                              Text(
                                                prices[index],
                                                style: TextStyle(
                                                    color: Color(0xff25AE4B),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 19),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xffDBF4D1),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                height: responsiveHeight(context, 26),
                                                width: responsiveWidth(context, 26),
                                                child: Center(
                                                  child: IconButton(
                                                    icon: Icon(Icons.remove),
                                                    onPressed: () => decreaseQuantity(index),
                                                    color: Color(0xff25AE4B),
                                                    iconSize: 16,
                                                    padding: EdgeInsets.zero, // يزيل أي فراغات داخل الزر
                                                    constraints: BoxConstraints(),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.symmetric(horizontal: 8),
                                                child: Text("${quantities[index]}",
                                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xff25AE4B),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                height: responsiveHeight(context, 26),
                                                width: responsiveWidth(context,26),
                                                child: Center(
                                                  child: IconButton(
                                                    icon: Icon(Icons.add),
                                                    onPressed: () => increaseQuantity(index),
                                                    color: Color(0xffDBF4D1),
                                                    iconSize: 16,
                                                    padding: EdgeInsets.zero, // يزيل أي فراغات داخل الزر
                                                    constraints: BoxConstraints(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ): Padding(padding: EdgeInsets.all(16),
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                SizedBox(height: responsiveHeight(context, 50),),
                                                Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/Empty.png"),
                              SizedBox(height: responsiveHeight(context, 20)),
                              Text(
                                "Cart Empty",
                                style: TextStyle(fontSize: 32, color: Color(0xff111827),fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: responsiveHeight(context, 10)),
                              Text(
                                "You don’t have add any foods in train at this time",
                                style: TextStyle(fontSize:16, color: Colors.grey,fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                                maxLines: 1, // يحدد أن النص يجب أن يكون في سطر واحد فقط

                              ),

                              SizedBox(height: responsiveHeight(context, 40)),
                            ]) ],),
                                          ),
                                        ),
                          ),
                        ),
    Positioned(
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Padding(
      padding: const EdgeInsets.only(top: 430),
      child: Container(
      height: 206,
      width: responsiveWidth(context, 387),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
      image: DecorationImage(
      image: AssetImage('assets/images/Pattern.png'),
      fit: BoxFit.cover,
      ),
      color: Color(0xff25AE4B),
      borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
      children: [
      // نفس الكود اللي عندك تماماً
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text("Sub-Total", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400)),
      Text("100\$", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400)),
      ],
      ),
      SizedBox(height:responsiveHeight(context, 3)),
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text("Delivery Charge", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400)),
      Text("10\$", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400)),
      ],
      ),
      SizedBox(height: responsiveHeight(context, 3)),
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text("discount", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400)),
      Text("10\$", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400)),
      ],
      ),
      SizedBox(height:  responsiveHeight(context, 3)),
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text("Total:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18)),
      Text("110\$", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18)),
      ],
      ),
      SizedBox(height:  responsiveHeight(context, 20)),
      SizedBox(
      height:  responsiveHeight(context, 57),
      width: double.infinity,
      child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      padding: EdgeInsets.symmetric(vertical: 13),
      ),
      child: Text(
      "Place My Order",
      style: TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.w700),
      ),
      ),
                          // الجزء الثاني من الكود (سلة الدفع) تبقى كما هي

      )],
                      ),
                      ),
    )))],
                ),
              ]),

            ),

            // ثاني تبويب (السلة)


        ));


  }
}
