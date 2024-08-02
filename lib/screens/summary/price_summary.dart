import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:unearthed/screens/summary/congrats.dart';
import 'package:unearthed/screens/summary/delivery_radio_widget.dart';
import 'package:unearthed/screens/summary/price_summary.dart';
import 'package:unearthed/screens/summary/summary_image_widget.dart';
import 'package:unearthed/screens/to_rent/confirm_rent.dart';
import 'package:unearthed/screens/to_rent/rent_this_next_bar.dart';
import 'package:unearthed/screens/summary/summary.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:unearthed/models/dress.dart';
import 'package:unearthed/models/dress_renter.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:unearthed/globals.dart' as globals;

class PriceSummary extends StatelessWidget {
  const PriceSummary(this.price, this.noOfDays, this.deliveryType, {super.key});

  final int price;
  final int noOfDays;
  final int deliveryType;

  @override
  Widget build(BuildContext context) {
    int pricePerDay = price~/noOfDays;
    int finalPrice = price + 100;
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
                Text('$pricePerDay x $noOfDays days',style: TextStyle(fontSize: 14, color: Colors.grey[700]) ),
                Expanded(child: SizedBox()),
                Text('$pricePerDay${globals.thb}', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('Delivery fee', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                Expanded(child: SizedBox()),
                Text('100${globals.thb}', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            
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