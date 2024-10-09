import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/item_renter.dart';
import 'package:unearthed/screens/profile/my_transactions_admin_image_widget.dart';
import 'package:unearthed/services/class_store.dart';


class MyPurchasesAdminList extends StatefulWidget {
  const MyPurchasesAdminList({super.key});

  @override
  State<MyPurchasesAdminList> createState() => _MyPurchasesAdminListState();
}

class _MyPurchasesAdminListState extends State<MyPurchasesAdminList> {
  

  List<ItemRenter> myPurchasesList = [];
  List<Item> myItems = [];

  @override
  void initState() {
    loadMyPurchasesAdminList();
    super.initState();
  }
  
  void loadMyPurchasesAdminList() {
    log('Loading loadMyPurchasesAdminList');
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
        }
        // for (Item d in allItems) {
        //   if (d.id == dr.itemId) {
        //     myItems.add(d);
        //   }
        // }
      }
    }
    if (myPurchasesList.isEmpty) {
      log('You have no purchases!');
    }
    myPurchasesList.sort((a, b) => a.startDate.compareTo(b.startDate));
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // String address = Provider.of<ItemStore>(context, listen: false).renters[0].address;
    return 
      Consumer<ItemStore>(
        builder: (context, value, child) {
        return ListView.builder(
          padding: EdgeInsets.all(width*0.01),
          itemCount: myPurchasesList.length,
          itemBuilder: (BuildContext context, int index) {
            // return MyPurchasesAdminImageWidget(myPurchasesList[index].itemId, myPurchasesList[index].startDate, myPurchasesList[index].endDate, myPurchasesList[index].price);
            return MyTransactionsAdminImageWidget(myPurchasesList[index], myPurchasesList[index].itemId, myPurchasesList[index].startDate, myPurchasesList[index].endDate, myPurchasesList[index].price, myPurchasesList[index].status);
        }
        );}
      );

  }}