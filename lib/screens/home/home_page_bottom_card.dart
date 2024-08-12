import 'package:flutter/material.dart';

class HomePageBottomCard extends StatelessWidget {
  const HomePageBottomCard(this.text, {super.key});
 
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 120,
      width: 150,
      child: Card(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(
            text, 
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16))),
          // child: Center(child: StyledHeading(text)),
        ),
            ),
    );
  }
}