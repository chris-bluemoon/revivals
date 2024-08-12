import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:unearthed/screens/summary/congrats.dart';
import 'package:unearthed/screens/summary/delivery_radio_widget.dart';
import 'package:unearthed/screens/summary/rental_price_summary.dart';
import 'package:unearthed/screens/summary/summary_image_widget.dart';
import 'package:unearthed/screens/to_rent/confirm_rent.dart';
import 'package:unearthed/screens/to_rent/rent_this_next_bar.dart';
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

class PurchasePriceSummary extends StatelessWidget {
  const PurchasePriceSummary(this.price, this.deliveryPrice, {super.key});

  final int price;
  final int deliveryPrice;

  @override
  Widget build(BuildContext context) {
    int finalPrice = price + deliveryPrice;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('PRICE DETAILS', style: TextStyle(fontSize: 14)),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('Purchase price', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                Expanded(child: SizedBox()),
                Text('$price${globals.thb}', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('Delivery fee', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                Expanded(child: SizedBox()),
                Text('$deliveryPrice${globals.thb}', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('Total', style: TextStyle(fontSize: 16, color: Colors.black)),
                Expanded(child: SizedBox()),
                Text('${finalPrice}${globals.thb}', style: TextStyle(fontSize: 16, color: Colors.black)),
            
              ],
            ),
          ),
      ],),
    );
  }
}