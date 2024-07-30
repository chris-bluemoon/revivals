import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/main.dart';
import 'package:unearthed/models/dress.dart';
import 'package:unearthed/screens/new_arrivals/dress_card.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/screens/to_rent/rent_this.dart';
import 'package:unearthed/screens/to_rent/dress_widget.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:uuid/uuid.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

var uuid = const Uuid();

// ignore: must_be_immutable
class ToRent extends StatefulWidget {
  ToRent(this.dress, {super.key});

  @override
  State<ToRent> createState() => _NewArrivalsState();

  final Dress dress;
  late String dressName;
  late String imageName;

  String setDressImage() {
    dressName = dress.name.replaceAll(RegExp(' '), '_');
    imageName = '${dress.brand}_${dressName}_Dress.webp';
    return imageName;
  }

}

class _NewArrivalsState extends State<ToRent> {
  
  List items = [1, 2];
  int currentIndex = 0;

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledTitle(widget.dress.name.toUpperCase()),
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
      body: Column(
        children: [
          SizedBox(height:10),
                    CarouselSlider(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                height: 450,
                autoPlay: true),
            items: items.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return DressWidget(dress: widget.dress, dressNumber: i);
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
          Text('DESCRIPTION HERE'),
        ],
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
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => (RentThis(widget.dress)))); 
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
