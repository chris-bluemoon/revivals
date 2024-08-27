import 'dart:developer';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/shared/styled_text.dart';

class SummaryImageWidget extends StatelessWidget {
  SummaryImageWidget(this.item, {super.key});

  final Item item;

  late String itemType;
  late String itemName;
  late String brandName;
  late String imageName;

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
    log('Screen width: $width.toString()');
    return Card(
      color: Colors.white,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: 
              Image.asset('assets/img/new_items/${setItemImage()}', fit: BoxFit.fitHeight, height: 0.25*width, width: 0.2*width)),
              // Image.asset('assets/img/new_items/${setItemImage()}', fit: BoxFit.fitHeight, height: width*0.125, width: width*0.1)),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyledHeading('${item.name} from ${item.brand}'),
              const SizedBox(height: 5),
              StyledBody('${StringUtils.capitalize(item.type)}, size ${item.size.toString()}', color: Colors.grey),
          ],)
        ],
      )

    );
  }
}