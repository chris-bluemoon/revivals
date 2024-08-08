import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:unearthed/main.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/screens/new_arrivals/item_card.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/screens/to_rent/rent_this.dart';
import 'package:unearthed/screens/to_rent/item_widget.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:uuid/uuid.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:intl/intl.dart';
import 'package:unearthed/globals.dart' as globals;

var uuid = const Uuid();

// ignore: must_be_immutable
class ToRent extends StatefulWidget {
  ToRent(this.item, {super.key});

  @override
  State<ToRent> createState() => _NewArrivalsState();

  final Item item;
  late String itemName;
  late String imageName;

  String setItemImage() {
    itemName = item.name.replaceAll(RegExp(' '), '_');
    imageName = '${item.brand}_${itemName}_Item.webp';
    return imageName;
  }



}

class _NewArrivalsState extends State<ToRent> {
  
  List items = [1, 2];
  int currentIndex = 0;

 String getCurrency() {
  var format = NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'THB');
  return format.currencySymbol;
}

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledTitle(widget.item.brand.toUpperCase()),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            CarouselSlider(
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  height: 400,
                  autoPlay: true),
              items: items.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return ItemWidget(item: widget.item, itemNumber: i);
                    // return const SizedBox(child: Text("BOX"), height: 20, width: 20);
                  },
                );
              }).toList(),
            ),
            Center(
              child: DotsIndicator(
                dotsCount: items.length,
                position: currentIndex.toDouble(),
                decorator: const DotsDecorator(
                  colors: [Colors.grey, Colors.grey],
                  activeColor: Colors.black,
                  // colors: [Colors.grey[300], Colors.grey[600], Colors.grey[900]], // Inactive dot colors
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: StyledHeading(widget.item.description),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10),
              child: StyledBody('Rental price: ${widget.item.rentPrice.toString()} ${globals.thb}'),
              // child: StyledBody('Rental price: ${widget.item.rentPrice.toString()} ${getCurrency()}'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(widget.item.longDescription),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(widget.item.longDescription),
            ),
          ],
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
