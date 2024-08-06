import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/dress.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:unearthed/globals.dart' as globals;

// ignore: must_be_immutable
class FavouritesCard extends StatelessWidget {
  FavouritesCard(this.dress, {super.key});

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
    bool isFav = false;
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
            Row(
              // mainAxisAlignment: MainAxisAlignment.left,
              children: [
                StyledHeading(dress.name),
                Expanded(child: SizedBox()),
                isFav ?  IconButton(
                  icon: Icon(Icons.favorite), color: Colors.red,
                  onPressed: () {
                    log('Pressed Fav');
                      isFav = false;
                      // Provider.of<DressStore>(context, listen: false)
                      //   .toggleDressFav(dress);
                  }) : 
                  IconButton(
                    icon: Icon(Icons.favorite_border_outlined),
                    onPressed: () {
                      log('Pressed empty Fav on dress ID: ${dress.id}');
                      isFav = true;
                      // Provider.of<DressStore>(context, listen: false)
                      //   .toggleDressFav(dress);
                    }
                  )
                  
              ],
            ),
            // StyledText('Size: ${dress.size.toString()}'),
            StyledBody('Rent for ${dress.rentPrice.toString()} ${globals.thb} per day'),
            StyledBodyStrikeout('RRP ${dress.rrp.toString()} ${globals.thb}'),
          ],
        ),
      ),
    );
  }
}