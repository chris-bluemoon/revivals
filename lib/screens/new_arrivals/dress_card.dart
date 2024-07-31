import 'package:flutter/material.dart';
import 'package:unearthed/models/dress.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:unearthed/globals.dart' as globals;

// ignore: must_be_immutable
class DressCard extends StatelessWidget {
  DressCard(this.dress, {super.key});

  final Dress dress;
  late String imageName;
  late String dressName;
  late String brandName;

  String setDressImage() {
    dressName = dress.name.replaceAll(RegExp(' +'), '_');
    brandName = dress.brand.replaceAll(RegExp(' +'), '_');
    imageName = '${brandName}_${dressName}_Dress_1.jpg';
    return imageName;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: StyledHeading(dress.brand)),
            // Image.asset('assets/img/new_dresses/${setDressImage()}', width: 200, height: 600),
            Expanded(child: Image.asset('assets/img/new_dresses/${setDressImage()}'),),
            // Image.asset('assets/img/new_dresses/${setDressImage()}', fit: BoxFit.fill),
            StyledHeading(dress.name),
            // StyledText('Size: ${dress.size.toString()}'),
            StyledBody('Rent for ${dress.rentPrice.toString()} ${globals.thb} per day'),
            StyledBodyStrikeout('RRP ${dress.rrp.toString()} ${globals.thb}'),
          ],
        ),
      ),
    );
  }
}