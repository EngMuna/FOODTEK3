import 'package:flutter/material.dart';

class Profe extends StatefulWidget {
  const Profe({super.key});

  @override
  State<Profe> createState() => _ProfeState();
}

class _ProfeState extends State<Profe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        body: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.all(16.0),
      child: Column(
      children: [
       SizedBox(height:30,),
        Row(children: [ IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
        Navigator.pop(context);
      },
    ),
       Text("profile",style: TextStyle(fontSize: 20,color: Color(0xff391713),fontWeight: FontWeight.w600),),],),
           SizedBox(height:4,),
          CircleAvatar(radius: 40, backgroundImage: AssetImage("assets/images/man2.png")),
          SizedBox(height: 7),
              Text('Ahmad Daboor', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
             Text('ahmad1709@gmail.com', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
        Container(
          child: Column(
            children: [

            ],
          ),
        )
     ],
     )
        ),
        )
    );
  }
}
