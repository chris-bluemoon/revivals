import 'package:flutter/material.dart';
import 'package:unearthed/screens/browse/category_items.dart';


class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

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
               colors: [Colors.grey, Colors.white],
               stops: [0.2, 1.0],
               // stops: [0.0, 0.5, 1.0],
             ),
           ),
           child: Row(
             children: [
               Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Image.asset('assets/img/new_items/transparent_dress.webp', height: 100),
               ),
               const SizedBox(width: 100),
               const Text('DRESSES', style: TextStyle(fontSize: 16)),
             ],
           )
         ),
         onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const CategoryItems('dress'))));
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
        const Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text('BAGS', style: TextStyle(fontSize: 16)),
        ),
        const SizedBox(width: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Image.asset('assets/img/new_items/bag_transparent.webp', height: 100),
        ),
      ],
    )
  ),
  onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const CategoryItems('bag'))));

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
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Image.asset('assets/img/new_items/jacket_transparent2.webp', height: 100),
               ),
               const SizedBox(width: 100),
               const Text('JACKETS', style: TextStyle(fontSize: 16)),
             ],
           )
         ),
         onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const CategoryItems('jacket'))));
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
        const Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text('PANTSUITS', style: TextStyle(fontSize: 16)),
        ),
        const SizedBox(width: 50),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Image.asset('assets/img/new_items/pantsuit_transparent.png', height: 100),
        ),
      ],
    )
  ),
  onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const CategoryItems('pantsuit'))));

  }
),


      ],
    );
  }
}