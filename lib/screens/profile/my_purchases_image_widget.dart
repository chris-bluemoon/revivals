import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/globals.dart' as globals;
import 'package:unearthed/models/item.dart';
import 'package:unearthed/services/class_store.dart';

class MyPurchasesImageWidget extends StatelessWidget {
  MyPurchasesImageWidget(this.itemId, this.startDate, this.endDate, this.price,
      {super.key});

  final String itemId;
  final String startDate;
  final String endDate;
  final int price;

  late String itemType;
  late String itemName;
  late String brandName;
  late String imageName;
  late Item item;


  String setItemImage() {
    itemType = item.type.replaceAll(RegExp(' +'), '_');
    itemName = item.name.replaceAll(RegExp(' +'), '_');
    brandName = item.brand.replaceAll(RegExp(' +'), '_');
    imageName = '${brandName}_${itemName}_${itemType}_1.jpg';
    return imageName;
  }

  @override
  Widget build(BuildContext context) {
    List<Item> allItems = Provider.of<ItemStore>(context, listen: false).items;
    DateTime fromDate = DateTime.parse(startDate);
    DateTime toDate = DateTime.parse(endDate);
    String fromDateString = DateFormat('d MMMM, y').format(fromDate);
    // yMMMMd('en_US')
    for (Item d in allItems) {
      if (d.id == itemId) {
        log('Found rented item, ${d.id} matches $itemId');
        item = d;
      }
    } 
    if (toDate.isBefore(DateTime.now().add(const Duration(days: 10)))) {
    } else {
    }
    return Card(
      shape: BeveledRectangleBorder(
    borderRadius: BorderRadius.circular(0.0),),
        color: Colors.white,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                        'assets/img/new_items/${setItemImage()}',
                        fit: BoxFit.fitHeight,
                        height: 100,
                        width: 80)),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${item.name} from ${item.brand}',
                    style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text('Purchased', style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5))),
                    const SizedBox(width: 30),
                    Text(fromDateString, style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.5))),
                  ],
                ),
                Text('Price ${price.toString()}${globals.thb}',
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.5))),
              ],
            )
          ],
        ));
  }
}
