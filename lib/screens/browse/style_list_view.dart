import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/screens/browse/style_items.dart';

class StyleListView extends StatelessWidget {
  const StyleListView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final leftRightPadding = screenWidth * 0.15;
    log('Width: ${screenWidth.toString()}');
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
        stops: [0.1, 1.0],
        // stops: [0.0, 0.5, 1.0],
      ),
    ),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: leftRightPadding),
          child: const Text('CLASSIC', style: TextStyle(fontSize: 16)),
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: EdgeInsets.only(right: leftRightPadding),
          child: Image.asset('assets/img/new_items/classic_transparent.png', height: 100),
        ),
      ],
    )
  ),
  onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const StyleItems('classic'))));

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
             gradient: const LinearGradient(
               colors: [Colors.grey, Colors.white],
               stops: [0.2, 1.0],
               // stops: [0.0, 0.5, 1.0],
             ),
           ),
           child: Row(
             children: [
               Padding(
          padding: EdgeInsets.only(left: leftRightPadding),
          child: Image.asset('assets/img/new_items/vintage_transparent.png', height: 100),
               ),
               const Expanded(child: SizedBox()),
               Padding(
                 padding: EdgeInsets.only(right: leftRightPadding),
                 child: const Text('VINTAGE', style: TextStyle(fontSize: 16)),
               ),
             ],
           )
         ),
         onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const StyleItems('vintage'))));
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
        stops: [0.1, 1.0],
        // stops: [0.0, 0.5, 1.0],
      ),
    ),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: leftRightPadding),
          child: const Text('ARTSY', style: TextStyle(fontSize: 16)),
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: EdgeInsets.only(right: leftRightPadding),
          child: Image.asset('assets/img/new_items/artsy_transparent.png', height: 100),
        ),
      ],
    )
  ),
  onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const StyleItems('artsy'))));

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
             gradient: const LinearGradient(
               colors: [Colors.grey, Colors.white],
               stops: [0.2, 1.0],
               // stops: [0.0, 0.5, 1.0],
             ),
           ),
           child: Row(
             children: [
               Padding(
          padding: EdgeInsets.only(left: leftRightPadding),
          child: Image.asset('assets/img/new_items/resort_transparent.png', height: 100),
               ),
               const Expanded(child: SizedBox()),
               Padding(
                 padding: EdgeInsets.only(right: leftRightPadding),
                 child: const Text('RESORT', style: TextStyle(fontSize: 16)),
               ),
             ],
           )
         ),
         onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const StyleItems('resort'))));
         },
       ),



      ],
    );
  }
}