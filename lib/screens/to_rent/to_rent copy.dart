import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/main.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/screens/new_arrivals/item_card.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/screens/to_rent/rent_this.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:uuid/uuid.dart';
import 'package:unearthed/shared/styled_text.dart';

var uuid = const Uuid();

// ignore: must_be_immutable
class ToRent extends StatefulWidget {
  ToRent(this.item, {super.key});

  @override
  State<ToRent> createState() => _NewArrivalsState();

  final Item item;
  late String itemType;
  late String itemName;
  late String imageName;

  String setItemImage() {
    itemType = item.type.replaceAll(RegExp(' '), '_');
    itemName = item.name.replaceAll(RegExp(' '), '_');
    imageName = '${item.brand}_${itemName}_${itemType}.webp';
    return imageName;
  }

}

class _NewArrivalsState extends State<ToRent> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledTitle(widget.item.name.toUpperCase()),
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
              icon: const Icon(Icons.share)),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/img/items/${widget.setItemImage()}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/img/items/${widget.setItemImage()}'),
                    ),
                  ],
                )
              ]
            )
          ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 3,
            )
          ],
        ),
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                    },
                    child: const Text('BUY PRELOVED', style: TextStyle(color: Colors.black)),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      side: BorderSide(width: 1.0, color: Colors.black),
                      ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => (RentThis(widget.item)))); 
                    },
                    child: const Text('RENT THIS', style: TextStyle(color: Colors.white)),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      side: BorderSide(width: 1.0, color: Colors.black),
                      ),
                  ),
                ),
              ],
            ),
          ),      
      );
  }
}
