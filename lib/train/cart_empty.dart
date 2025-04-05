import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'favorite.dart';
import 'home_screen.dart';
import '../../responsive.dart';

class CartEmpty extends StatefulWidget {
  const CartEmpty({super.key});

  @override
  State<CartEmpty> createState() => _CartEmptyState();
}

class _CartEmptyState extends State<CartEmpty> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.all(5),
        child: Column(
          children: [
            SingleChildScrollView(
                child: Padding(padding: EdgeInsets.all(16),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        SizedBox(height: 50,),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/Empty.png"),
                              SizedBox(height: 20),
                              Text(
                                "Cart Empty",
                                style: TextStyle(fontSize: 32, color: Color(0xff111827),fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "You don’t have add any foods in train at this time",
                                style: TextStyle(fontSize:16, color: Colors.grey,fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                                maxLines: 1, // يحدد أن النص يجب أن يكون في سطر واحد فقط

                              ),

                              SizedBox(height: 40),
                            ]) ],),
                  ),
                )),
          ],
        ),
      ),

    );
  }
}
