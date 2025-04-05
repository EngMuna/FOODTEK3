import 'package:flutter/material.dart';
import '../train/cart_screen.dart';
import '../train/favorite.dart';
import '../train/home_screen.dart';
import '../../responsive.dart';

class HistoryEmpty extends StatefulWidget {
  const HistoryEmpty({super.key});

  @override
  State<HistoryEmpty> createState() => _HistoryEmptyState();
}

class _HistoryEmptyState extends State<HistoryEmpty> {

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
                        SizedBox(height:  responsiveHeight(context, 50),),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/Empty.png"),
                              SizedBox(height: responsiveHeight(context, 20)),
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
                )),
          ],
        ),
      ),

    );
  }
}
