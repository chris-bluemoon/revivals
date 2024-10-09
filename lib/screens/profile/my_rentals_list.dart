import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/item_renter.dart';
import 'package:unearthed/screens/profile/my_transactions_image_widget.dart';
import 'package:unearthed/services/class_store.dart';


class MyRentalsList extends StatefulWidget {
  const MyRentalsList({super.key});

  @override
  State<MyRentalsList> createState() => _MyRentalsListState();
}

class _MyRentalsListState extends State<MyRentalsList> {
  

  List<ItemRenter> myRentalsList = [];
  List<Item> myItems = [];

  @override
  void initState() {
    loadMyRentalsList();
    super.initState();
  }
  
  void loadMyRentalsList() {
    log('Loading loadMyRentalsList');
    // get current user
    String userEmail = Provider.of<ItemStore>(context, listen: false).renter.email;
    // log('User email: $userEmail');
    // List<ItemRenter> myItemRenters = Provider.of<ItemStore>(context, listen: false).itemRenters;
    List<ItemRenter> allItemRenters = List.from(Provider.of<ItemStore>(context, listen: false).itemRenters);
    // List<Item> allItems = List.from(Provider.of<ItemStore>(context, listen: false).items);
    for (ItemRenter dr in allItemRenters) {
      if (dr.renterId == userEmail) {
        if (dr.transactionType == 'rental') {
          myRentalsList.add(dr);
          log('Rented: ${dr.itemId}');
        }
        // for (Item d in allItems) {
        //   if (d.id == dr.itemId) {
        //     myItems.add(d);
        //   }
        // }
      }
    }
    if (myRentalsList.isEmpty) {
      log('You have no rentals!');
    }
    myRentalsList.sort((a, b) => a.startDate.compareTo(b.startDate));
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // String address = Provider.of<ItemStore>(context, listen: false).renters[0].address;
    return 
      ListView.builder(
        padding: EdgeInsets.all(width*0.01),
        itemCount: myRentalsList.length,
        itemBuilder: (BuildContext context, int index) {
          return MyTransactionsImageWidget(myRentalsList[index], myRentalsList[index].itemId, myRentalsList[index].startDate, myRentalsList[index].endDate, myRentalsList[index].price, myRentalsList[index].status);
      }
    );

  }}