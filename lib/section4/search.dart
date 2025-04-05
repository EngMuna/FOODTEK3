import 'package:flutter/material.dart';

import '../responsive.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(bottom: 600),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xff1D1B20),),
              onPressed: () {},),
            SizedBox(
              width: responsiveWidth(context, 327) , // تحديد العرض
              height:responsiveHeight(context, 42) , // تحديد الارتفاع
              child: SearchAnchor(
                builder: (context, controller) => SearchBar(
                  controller: searchController,
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal:16)),

                  hintText: "Find your location",
                  hintStyle: MaterialStateProperty.all(
                    TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff878787),
                    ),
                  ), // استخدام MaterialStateProperty.all هنا
                  leading: Icon(Icons.search,color: Color(0xff25AE4B),), // أيقونة البحث في البداية
                  backgroundColor: MaterialStateProperty.all(Color(0xffFFFFFF)), // تغيير لون الخلفية
                  onChanged: (query) {
                    // تنفيذ منطق البحث عند إدخال النص
                  },
                ),
                suggestionsBuilder: (context, query) {
                  return []; // لا يوجد اقتراحات حالياً
                },
              ),
            ),
          ],
        ),
      )

        ;
  }
}