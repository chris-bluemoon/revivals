import 'package:flutter/material.dart';

class OccasionGridTile extends StatelessWidget {
  OccasionGridTile(this.occasion, {super.key});

  final String occasion;
  late String formattedOccasion;

  String setItemImage() {
    formattedOccasion = occasion.replaceAll(RegExp(' +'), '_');
    return 'assets/img/new_items/${formattedOccasion}_transparent.png';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            // border: Border.all(
              // color: Colors.red,
            // ),
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Column(
            children: [
              Image.asset(setItemImage(), height: 80),
            ],
          )

        ),
      ],
    );
  }
}