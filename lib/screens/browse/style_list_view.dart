import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/screens/browse/category_items.dart';
import 'package:unearthed/screens/browse/style_items.dart';

class StyleListView extends StatelessWidget {
  const StyleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
                      GestureDetector(
  child: Container(
    margin: const EdgeInsets.all(15.0),
    padding: const EdgeInsets.all(0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(5.0), 
      color: Colors.grey,
      gradient: const LinearGradient(
        // begin: Alignment.topCenter,
        // end: Alignment.bottomCenter,
        colors: [Colors.white, Colors.grey],
        stops: [0.2, 1.0],
        // stops: [0.0, 0.5, 1.0],
      ),
    ),
    child: Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text('CLASSIC', style: TextStyle(fontSize: 16)),
        ),
        SizedBox(width: 50),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Image.asset('assets/img/new_items/classic_transparent.png', height: 100),
        ),
      ],
    )
  ),
  onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => (StyleItems('classic'))));

  }
),
       GestureDetector(
         child: Container(
           margin: const EdgeInsets.all(15.0),
           padding: const EdgeInsets.all(0),
           decoration: BoxDecoration(
             border: Border.all(color: Colors.white),
             borderRadius: BorderRadius.circular(5.0), 
             color: Colors.grey,
             gradient: LinearGradient(
               colors: [Colors.grey, Colors.white],
               stops: [0.2, 1.0],
               // stops: [0.0, 0.5, 1.0],
             ),
           ),
           child: Row(
             children: [
               Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Image.asset('assets/img/new_items/vintage_transparent.png', height: 100),
               ),
               SizedBox(width: 100),
               Text('VINTAGE', style: TextStyle(fontSize: 16)),
             ],
           )
         ),
         onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (StyleItems('vintage'))));
         },
       ),
       GestureDetector(
  child: Container(
    margin: const EdgeInsets.all(15.0),
    padding: const EdgeInsets.all(0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(5.0), 
      color: Colors.grey,
      gradient: const LinearGradient(
        // begin: Alignment.topCenter,
        // end: Alignment.bottomCenter,
        colors: [Colors.white, Colors.grey],
        stops: [0.2, 1.0],
        // stops: [0.0, 0.5, 1.0],
      ),
    ),
    child: Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text('ARTSY', style: TextStyle(fontSize: 16)),
        ),
        SizedBox(width: 50),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Image.asset('assets/img/new_items/artsy_transparent.png', height: 100),
        ),
      ],
    )
  ),
  onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => (StyleItems('artsy'))));

  }
),
              GestureDetector(
         child: Container(
           margin: const EdgeInsets.all(15.0),
           padding: const EdgeInsets.all(0),
           decoration: BoxDecoration(
             border: Border.all(color: Colors.white),
             borderRadius: BorderRadius.circular(5.0), 
             color: Colors.grey,
             gradient: LinearGradient(
               colors: [Colors.grey, Colors.white],
               stops: [0.2, 1.0],
               // stops: [0.0, 0.5, 1.0],
             ),
           ),
           child: Row(
             children: [
               Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Image.asset('assets/img/new_items/resort_transparent.png', height: 100),
               ),
               SizedBox(width: 100),
               Text('RESORT', style: TextStyle(fontSize: 16)),
             ],
           )
         ),
         onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (StyleItems('resort'))));
         },
       ),



      ],
    );
  }
}