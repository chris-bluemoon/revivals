import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:unearthed/screens/to_rent/confirm_rent.dart';
import 'package:unearthed/screens/summary/summary2.dart';
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

class RentThisNextBar extends StatefulWidget {
  const RentThisNextBar(this.dress, this.noOfDays, this.startDate, this.endDate, {super.key});

  final Dress dress;
  final int noOfDays;
  final DateTime startDate;
  final DateTime endDate;

  @override
  State<RentThisNextBar> createState() => _RentThisNextBarState();
}

class _RentThisNextBarState extends State<RentThisNextBar> {
  @override
  Widget build(BuildContext context) {

    int totalPrice = widget.dress.rentPrice * widget.noOfDays;

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('${totalPrice}${globals.thb} for ${widget.noOfDays} days', style: TextStyle(fontSize: 18),),
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.fromLTRB(10,10,20,10),
          child: SizedBox(
            width: 120,
            child: OutlinedButton(
                      onPressed: () {
                      //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => (Summary('email', widget.dress, 'start date','end date')))); 
                      //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => (Summary())));
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => (Summary2(widget.dress, widget.startDate, widget.endDate, widget.noOfDays, widget.dress.rentPrice))));
                      },
                      child: const Text('NEXT', style: TextStyle(color: Colors.white)),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.0),
                        ),
                        side: BorderSide(width: 1.0, color: Colors.black),
                        ),
                    ),
          ),
        )
      ],
    );
  }
}