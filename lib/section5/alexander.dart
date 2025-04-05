import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';
import 'chat_page.dart';

class Alexander extends StatefulWidget {
  const Alexander({super.key});

  @override
  State<Alexander> createState() => _AlexanderState();
}

class _AlexanderState extends State<Alexander> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/photo man.png'), // استبدلها بالصورة المناسبة
          ),
          title: const Text('Your Delivery Hero',style: TextStyle(fontSize: 12,fontWeight:FontWeight.w500,color: Color(0xff878787)),),
          subtitle:

          Row(
            children: [
              Text('Aleksandr V.',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xff2F2E36)),),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Color(0xffF2AB58), size: 16),
                    Text(' 4,9',style: TextStyle(color: Color(0xffB8B8B8),fontWeight: FontWeight.w400,fontSize: 13),),
                  ],
                ),
              ),

            ],
          ),

          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width:  responsiveWidth(context, 40),
                height: responsiveHeight(context, 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:Color(0xffF5F5F5),),
                child: Icon(Icons.phone, color: Colors.green),),
              SizedBox(width:  responsiveWidth(context, 10)),
              Container(
                width: responsiveWidth(context, 40),
                height: responsiveHeight(context, 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:Color(0xffF5F5F5),),
                child:IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage()),
                    );
                  },
                  icon: Icon(Icons.message, color: Colors.orange),
                )
                ,),

            ],
          ),
        ),
        Container(
          height:responsiveHeight(context,1),// سمك الخط
          width:responsiveWidth(context, 440),
          color: Color(0xffF5F5F5), // اللون الأسود الفاتح باستخدام opacity
        ),
        SizedBox(height: responsiveHeight(context,10),),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("your location",style: TextStyle(fontSize: 12,color: Color(0xff878787),fontWeight: FontWeight.w600),),
            SizedBox(height:responsiveHeight(context,12),),
            Row(
              children: [
                Icon(Icons.location_on_outlined,color: Color(0xff4CAF50),),
                Text("123 Al-Madina Street, Abdali, Amman, Jordan",style: TextStyle(fontSize: 12,color: Color(0xff6C7278),fontWeight: FontWeight.w600)),
              ],
            )

          ],
        ),
      ],
    );
  }
}
