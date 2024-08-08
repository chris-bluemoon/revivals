import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:unearthed/globals.dart' as globals;

// ignore: must_be_immutable
class FavouritesCard extends StatelessWidget {
  FavouritesCard(this.item, {super.key});

  final Item item;
  late String imageName;
  late String itemName;
  late String brandName;

  String setItemImage() {
    itemName = item.name.replaceAll(RegExp(' +'), '_');
    brandName = item.brand.replaceAll(RegExp(' +'), '_');
    imageName = '${brandName}_${itemName}_Item_1.jpg';
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
            
            Center(child: StyledHeading(item.brand)),
            // Image.asset('assets/img/new_items/${setItemImage()}', width: 200, height: 600),
            Expanded(child: Image.asset('assets/img/new_items/${setItemImage()}'),),
            // Image.asset('assets/img/new_items/${setItemImage()}', fit: BoxFit.fill),
            Row(
              // mainAxisAlignment: MainAxisAlignment.left,
              children: [
                StyledHeading(item.name),
                Expanded(child: SizedBox()),
                isFav ?  IconButton(
                  icon: Icon(Icons.favorite), color: Colors.red,
                  onPressed: () {
                    log('Pressed Fav');
                      isFav = false;
                      // Provider.of<ItemStore>(context, listen: false)
                      //   .toggleItemFav(item);
                  }) : 
                  IconButton(
                    icon: Icon(Icons.favorite_border_outlined),
                    onPressed: () {
                      log('Pressed empty Fav on item ID: ${item.id}');
                      isFav = true;
                      // Provider.of<ItemStore>(context, listen: false)
                      //   .toggleItemFav(item);
                    }
                  )
                  
              ],
            ),
            // StyledText('Size: ${item.size.toString()}'),
            StyledBody('Rent for ${item.rentPrice.toString()} ${globals.thb} per day'),
            StyledBodyStrikeout('RRP ${item.rrp.toString()} ${globals.thb}'),
          ],
        ),
      ),
    );
  }
}