import 'package:flutter/material.dart';

class HomePageCard extends StatelessWidget {
  const HomePageCard({super.key});

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   width: 300,
    //   height: 100,
    //   child: const Card(
    //   ),
    // );
    return Container(
      height: 10,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10), 
        child: Card(
          color: Colors.blue,
          child: Center(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Text('CARD'),
          ),),
      )),
    );
  }
}