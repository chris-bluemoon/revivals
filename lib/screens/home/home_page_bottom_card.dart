import 'package:flutter/material.dart';
import 'package:unearthed/shared/styled_text.dart';

class HomePageBottomCard extends StatelessWidget {
  const HomePageBottomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10), 
        child: Card(
          color: Colors.blue,
          child: Center(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: StyledHeading('CARD'),
          ),),
      )),
    );
  }
}