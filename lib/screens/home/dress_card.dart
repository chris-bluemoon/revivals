import 'package:flutter/material.dart';
import 'package:unearthed/models/dress.dart';
import 'package:unearthed/shared/styled_text.dart';

// ignore: must_be_immutable
class DressCard extends StatelessWidget {
  DressCard(this.dress, {super.key});

  final Dress dress;
  late String imageName;
  late String dressName;

  String setDressImage() {
    dressName = dress.name.replaceAll(RegExp(' '), '_');
    imageName = '${dress.brand}_${dressName}_Dress.webp';
    return imageName;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Image.asset('assets/img/dresses/${setDressImage()}')),
            // Expanded(child: Image.asset('assets/img/dresses/$imageName')),
            // Expanded(child: Image.asset('assets/img/dresses/test.png')),
            StyledHeading(dress.name),
            // StyledText('Size: ${dress.size.toString()}'),
            StyledBody('Rent ${dress.rentPrice.toString()} per day'),
            StyledBodyStrikeout('RRP ${dress.rrp.toString()}'),
          ],
        ),
      ),
    );
  }
}