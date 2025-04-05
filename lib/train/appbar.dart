import 'package:flutter/material.dart';

class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();
}
class _AppbarState extends State<Appbar> {
  List<String> item = ['Current location', 'item1', 'item2', 'item3'];
  String? selectedItem = "Current location"; // قيمة العنصر المحدد

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
    children: [
    ListTile(
    leading: const Icon(Icons.location_on), // الأيقونة الأولى
    title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // لضبط المسافات بين العناصر
    children: [
    DropdownButton<String>(
    value: selectedItem,
    items: item.map((String item) {
    return DropdownMenuItem<String>(
    value: item,
    child: Text(item),
    );
    }).toList(),
    onChanged: (String? newValue) {
    setState(() {
    selectedItem = newValue; // تغيير القيمة المحددة
    });
    },
    ),
    const Icon(Icons.settings), // الأيقونة الثانية
    ],
    ),
    subtitle: const Text("Subtitle of the ListTile"),
    ),
    ],
    ),
    ));
  }
}
