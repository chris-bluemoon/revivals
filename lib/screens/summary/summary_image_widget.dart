import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:unearthed/screens/summary/congrats.dart';
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

class SummaryImageWidget extends StatelessWidget {
  const SummaryImageWidget(this.dress, {super.key});

  final Dress dress;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: 
              Image.asset('assets/img/new_dresses/ZIMMERMANN_Tuxedo_Dress_1.jpg', fit: BoxFit.fitHeight, height: 100, width: 80)),
          SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${dress.name} from ${dress.brand}', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 5),
              Text('Dress, Size ${dress.size.toString()}', style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5))),
          ],)
        ],
      )

    );
  }
}