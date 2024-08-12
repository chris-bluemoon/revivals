import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/item_renter.dart';
import 'dart:developer';

import 'package:unearthed/screens/profile/my_purchases_image_widget.dart';
import 'package:unearthed/services/class_store.dart';


class MyPurchasesList extends StatefulWidget {
  const MyPurchasesList({super.key});

  @override
  State<MyPurchasesList> createState() => _MyPurchasesListState();
}

class _MyPurchasesListState extends State<MyPurchasesList> {
  

  List<ItemRenter> myPurchasesList = [];
  List<Item> myItems = [];

  @override
  void initState() {
    loadMyPurchasesList();
    super.initState();
  }
  
  void loadMyPurchasesList() {
    log('Loading loadMyPurchasesList');
    // get current user
    String userEmail = Provider.of<ItemStore>(context, listen: false).renter.email;
    // log('User email: $userEmail');
    // List<ItemRenter> myItemRenters = Provider.of<ItemStore>(context, listen: false).itemRenters;
    List<ItemRenter> allItemRenters = List.from(Provider.of<ItemStore>(context, listen: false).itemRenters);
    // List<Item> allItems = List.from(Provider.of<ItemStore>(context, listen: false).items);
    for (ItemRenter dr in allItemRenters) {
      if (dr.renterId == userEmail) {
        if (dr.transactionType == 'purchase') {
          myPurchasesList.add(dr);
          log('Purchased: ${dr.itemId}');
        }
        // for (Item d in allItems) {
        //   if (d.id == dr.itemId) {
        //     if (dr.transactionType == 'purchase') {
        //       myItems.add(d);
        //     }
        //   }
        // }
      }
    }
    if (myPurchasesList.isEmpty) {
      log('You have no rentals!');
    }
    myPurchasesList.sort((a, b) => a.startDate.compareTo(b.startDate));
  }
  @override
  Widget build(BuildContext context) {

    // String address = Provider.of<ItemStore>(context, listen: false).renters[0].address;
    return 
      ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: myPurchasesList.length,
        itemBuilder: (BuildContext context, int index) {
          return MyPurchasesImageWidget(myPurchasesList[index].itemId, myPurchasesList[index].startDate, myPurchasesList[index].endDate, myPurchasesList[index].price);
      }
    );

  }}