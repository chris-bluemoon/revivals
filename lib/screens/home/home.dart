import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/screens/new_arrivals/new_arrivals.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/new_arrivals'),
            icon: Icon(Icons.abc)
        ),
            // onPressed: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => NewArrivals()),
            //   );
            //   log('Just pushed NewArrivals');
            // }
        ],)
    );

  }
}