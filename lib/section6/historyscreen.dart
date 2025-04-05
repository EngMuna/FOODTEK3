import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../responsive.dart';
import 'homepagee.dart';

class Historyscreen extends StatefulWidget {
  Historyscreen ({super.key});

  @override
  _HistoryscreenState createState() => _HistoryscreenState();
}

class _HistoryscreenState extends State<Historyscreen> {
  List<String> images = [
    "assets/images/burger.png",
    "assets/images/shawerma.png",
    "assets/images/pizaa.png"
  ];

  List<String> productTitle = [
    "Chicken Burger",
    "Onion Pizza",
    "Spicy Shawarma"
  ];

  List<String> prices = [
    "\$20",
    "\$15",
    "\$15"
  ];

  List<String> subTitle = [
    "Burger Factory LTD",
    "Pizza Palace",
    "Hot Cool Spot"
  ];

  List<int> quantities = [1, 1, 1]; // ✅ قائمة لحفظ عدد الكميات لكل منتج

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
    String input = "25-3-2024";
    DateTime myDate = DateFormat("d-M-yyyy").parse(input);
    String formattedDate = DateFormat('d-M-yyyy').format(myDate); // نفس التنسيق الأصلي

    return  Scaffold(
        backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 70,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 80, ), // ✅ تحديد ارتفاع للـ ListView.builder حتى يظهر
                    child:
                    images.isNotEmpty?
                    Padding(
                      padding: EdgeInsets.only(bottom: 50, left: 30, right: 30),
                      child: Column(
                        children: [
                          ListView.builder(
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
                                          height:  responsiveHeight(context,62),
                                          width:  responsiveWidth(context, 62),
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
                                          SizedBox(height: responsiveHeight(context, 5)),
                                          Text(
                                            subTitle[index],
                                            style: TextStyle(
                                                color: Color(0xff3B3B3B),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          ),
                                          SizedBox(height:  responsiveHeight(context, 5)),
                                          Text(
                                            prices[index],
                                            style: TextStyle(
                                                color: Color(0xff25AE4B),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 19),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.access_time_sharp,color: Colors.green,size: 15,),
                                              Text(' $formattedDate',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 12,color: Color(0xff3B3B3B))),
                                              ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.refresh,color:Color(0xff25AE4B) ,),
                                              Text("Reorder",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 12,color: Color(0xff25AE4B)),),
                                            ],
                                          )
                                        ],
                                      ),
                                        ],
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height:  responsiveHeight(context, 30)), // مسافة بين القائمة والنص
                          Center(
                            child: Text(
                              "Load More..",
                              style: TextStyle(fontSize:16, fontWeight: FontWeight.w500,color: Color(0xff25AE4B)),
                            ),
                          ),],
                      ),


                    ): Padding(
    padding:  EdgeInsets.all(5),
    child: Column(
    children: [
    SingleChildScrollView(
    child: Padding(padding: EdgeInsets.all(16),
    child: Center(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
    SizedBox(height:  responsiveHeight(context, 50),),
    Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Image.asset("assets/images/Empty.png"),
    SizedBox(height:  responsiveHeight(context, 20)),
    Text(
    "History Empty",
    style: TextStyle(fontSize: 32, color: Color(0xff111827),fontWeight: FontWeight.w700),
    textAlign: TextAlign.center,
    ),
    SizedBox(height:  responsiveHeight(context, 10)),
    Text(
    "You don’t have order any foods before",
    style: TextStyle(fontSize:16, color: Colors.grey,fontWeight: FontWeight.w700),
    textAlign: TextAlign.center,
    maxLines: 1, // يحدد أن النص يجب أن يكون في سطر واحد فقط

    ),

    SizedBox(height:  responsiveHeight(context, 40)),
    ]) ],),
    ),
    ),
                  ),
                  // الجزء الثاني من الكود (سلة الدفع) تبقى كما هي

                ],
              ),
                    ),
                  ),
                  ],
          ),


               ]),

      ),

      // ثاني تبويب (السلة)


    ));


  }
}
