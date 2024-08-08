import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/screens/to_rent/confirm_rent.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/item_renter.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/screens/summary/congrats.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Summary extends StatefulWidget {
  const Summary(this.email, this.item, this.startDate, this.endDate, {super.key});


  final String email;
  final Item item;
  final String startDate;
  final String endDate;

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  
  void handleSubmit(String renterId, String itemId, String startDate, String endDate, int price) {
    Provider.of<ItemStore>(context, listen: false).addItemRenter(ItemRenter(
      id: uuid.v4(),
      renterId: renterId,
      itemId: itemId,
      startDate: startDate,
      endDate: endDate,
      price: 0,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // StyledTitle(widget.item.name.toUpperCase()),
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
        Text(widget.startDate),
        Text(widget.endDate),
        Text(widget.item.name),
        Text(widget.email),
        ElevatedButton(
            child: Text('Confirm'),
            onPressed: () {
                handleSubmit(widget.email, widget.item.id, widget.startDate, widget.endDate, widget.item.rentPrice);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const Congrats())));
            },
          ),

        ],
      ),
    );
  }
}