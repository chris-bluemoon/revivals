import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:unearthed/screens/summary/congrats.dart';
import 'package:unearthed/screens/to_rent/confirm_rent.dart';
import 'package:unearthed/screens/to_rent/rent_this_next_bar.dart';
import 'package:unearthed/screens/summary/summary.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/item_renter.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:unearthed/globals.dart' as globals;

class SummaryImageWidget extends StatelessWidget {
  SummaryImageWidget(this.item, {super.key});

  final Item item;

  late String itemName;
  late String brandName;
  late String imageName;

  String setItemImage() {
    itemName = item.name.replaceAll(RegExp(' +'), '_');
    brandName = item.brand.replaceAll(RegExp(' +'), '_');
    imageName = '${brandName}_${itemName}_Item_1.jpg';
    return imageName;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: 
              Image.asset('assets/img/new_items/${setItemImage()}', fit: BoxFit.fitHeight, height: 100, width: 80)),
          SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${item.name} from ${item.brand}', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 5),
              Text('Item, Size ${item.size.toString()}', style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5))),
          ],)
        ],
      )

    );
  }
}