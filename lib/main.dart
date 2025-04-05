import 'package:flutter/material.dart';
import 'package:web/section4/check_out.dart';
import 'package:web/section4/location1.dart';
import 'package:web/section5/track.dart';


void main() {
  runApp(MyApp());//
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'Shopping Cart',
      theme:ThemeData(primarySwatch: Colors.green),
      home: Location1 (),
    );
  }
}
