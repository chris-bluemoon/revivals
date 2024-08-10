import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/item_renter.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/screens/home/home.dart';
import 'dart:developer';

import 'package:unearthed/screens/home/my_app_client.dart';
import 'package:unearthed/screens/profile/address_form.dart';
import 'package:unearthed/screens/profile/my_rentals_image_widget.dart';
import 'package:unearthed/screens/profile/profile.dart';
import 'package:unearthed/screens/profile/profile_landing.dart';
import 'package:unearthed/shared/send_whatsapp.dart';
import 'package:unearthed/shared/whatsapp.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/models/renter.dart';


class MyRentals extends StatefulWidget {
  const MyRentals({super.key});

  @override
  State<MyRentals> createState() => _MyRentalsState();
}

class _MyRentalsState extends State<MyRentals> {
  

  List<ItemRenter> myRentals = [];
  List<Item> myItems = [];

  @override
  void initState() {
    loadMyRentals();
    super.initState();
  }
  
  void loadMyRentals() {
    log('Loading loadMyRentals');
    // get current user
    String userEmail = Provider.of<ItemStore>(context, listen: false).renter.email;
    // log('User email: $userEmail');
    // List<ItemRenter> myItemRenters = Provider.of<ItemStore>(context, listen: false).itemRenters;
    List<ItemRenter> allItemRenters = List.from(Provider.of<ItemStore>(context, listen: false).itemRenters);
    List<Item> allItems = List.from(Provider.of<ItemStore>(context, listen: false).items);
    for (ItemRenter dr in allItemRenters) {
      if (dr.renterId == userEmail) {
        myRentals.add(dr);
        log('Rented: ${dr.itemId}');
        for (Item d in allItems) {
          if (d.id == dr.itemId) {
            myItems.add(d);
          }
        }
      }
    }
    if (myRentals.isEmpty) {
      log('You have no rentals!');
    }
    myRentals.sort((a, b) => a.startDate.compareTo(b.startDate));
  }
  @override
  Widget build(BuildContext context) {

    // String address = Provider.of<ItemStore>(context, listen: false).renters[0].address;
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('My Rentals'),
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
            )),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: myRentals.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
          height: 100,
          child: MyRentalsImageWidget(myRentals[index].itemId, myRentals[index].startDate, myRentals[index].endDate, myRentals[index].price),
        );
      }
    ));

  }}