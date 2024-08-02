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


var uuid = const Uuid();

class Summary2 extends StatefulWidget {
  const Summary2(this.dress, this.startDate, this.endDate, this.noOfDays, this.price, {super.key});

  final Dress dress;
  final DateTime startDate;
  final DateTime endDate;
  final int noOfDays;
  final int price;

  @override
  State<Summary2> createState() => _Summary2State();
}

class _Summary2State extends State<Summary2> {
  // final int i;
  @override
  Widget build(BuildContext context) {

  void handleSubmit(String renterId, String dressId, String startDate, String endDate, int price) {
    Provider.of<DressStore>(context, listen: false).addDressRenter(DressRenter(
      id: uuid.v4(),
      renterId: renterId,
      dressId: dressId,
      startDate: startDate,
      endDate: endDate,
      price: price,
    ));
  }

  return Scaffold(
        appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // StyledTitle(widget.dress.name.toUpperCase()),
            StyledTitle('Summary'),
            // Image.asset(
            //   'assets/logos/unearthed_logo_2.png',
            //   fit: BoxFit.contain,
            //   height: 200,
            // ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () =>
                {Navigator.of(context).popUntil((route) => route.isFirst)},
              icon: const Icon(Icons.close)),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          )
        ),
      ),
      body: Column(
        children: [
          Text(widget.dress.name),
          Text(widget.startDate.toString()),
          Text(widget.endDate.toString()),
          Text(widget.noOfDays.toString()),
        ElevatedButton(
            child: Text('Confirm'),
            onPressed: () {
                String email = Provider.of<DressStore>(context, listen: false).renters[0].email;
                // final f = DateFormat('yyyyMMdd');
                // String startDateText = DateFormat('Y m d').format(startDate!);
                // String startDateText = f.format(widget.startDate);
                // String endDateText = f.format(widget.endDate);
                String startDateText = widget.startDate.toString();
                String endDateText = widget.endDate.toString();
                handleSubmit(email, widget.dress.id, startDateText, endDateText, widget.dress.rentPrice);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const Congrats())));
            },
          ),

        ],
      ),
    );
  }
}