import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/globals.dart' as globals;
import 'package:unearthed/models/item.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/styled_text.dart';

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
    double width = MediaQuery.of(context).size.width;
    List<Item> allItems = Provider.of<ItemStore>(context, listen: false).items;
    DateTime fromDate = DateTime.parse(startDate);
    DateTime toDate = DateTime.parse(endDate);
    String fromDateString = DateFormat('d MMMM, y').format(fromDate);
    String toDateString = DateFormat('d MMMM, y').format(toDate);
    // yMMMMd('en_US')
    for (Item d in allItems) {
      if (d.id == itemId) {
        log('Found purchased item, ${d.id} matches $itemId');
        item = d;
      }
    } 
    ColorFilter greyscale = const ColorFilter.matrix(<double>[
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);
    if (toDate.isBefore(DateTime.now().add(const Duration(days: 10)))) {
      greyscale = const ColorFilter.matrix(<double>[
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
      ]);
    } else {
      greyscale = const ColorFilter.mode(Colors.transparent, BlendMode.multiply);
    }
    return Card(
      margin: EdgeInsets.only(bottom: width*0.04),
      shape: BeveledRectangleBorder(
    borderRadius: BorderRadius.circular(0.0),),
        color: Colors.white,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ColorFiltered(
                    colorFilter: greyscale,
                    child: Image.asset(
                        'assets/img/new_items/${setItemImage()}',
                        fit: BoxFit.fitHeight,
                        height: width*0.25,
                        width: width*0.2))),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledBody('${item.name} from ${item.brand}', weight: FontWeight.normal,),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const StyledBody('From', color: Colors.grey, weight: FontWeight.normal),
                    const SizedBox(width: 30),
                    StyledBody(fromDateString, color: Colors.grey, weight: FontWeight.normal),
                  ],
                ),
                Row(
                  children: [
                    const StyledBody('To', color: Colors.grey, weight: FontWeight.normal),
                    const SizedBox(width: 47),
                    StyledBody(toDateString, color: Colors.grey, weight: FontWeight.normal),
                  ],
                ),
                StyledBody('Price ${price.toString()}${globals.thb}', color: Colors.grey, weight: FontWeight.normal),
              ],
            )
          ],
        ));
  }
}
