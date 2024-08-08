import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/screens/browse/designer_item_card.dart';
import 'package:unearthed/screens/home/my_app_client.dart';
import 'package:unearthed/screens/new_arrivals/item_card.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/screens/to_rent/to_rent.dart';
import 'package:uuid/uuid.dart';
import 'package:unearthed/screens/sign_up/google_sign_in.dart';

var uuid = const Uuid();

class DesignerItems extends StatefulWidget {
  const DesignerItems(this.brand, {super.key});

  final String brand;

  @override
  State<DesignerItems> createState() => _DesignerItemsState();
}

class _DesignerItemsState extends State<DesignerItems> {


 
    final List<Item> brandItems = [];

    @override
    initState() {
      // getCurrentUser();
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    // getCurrentUser();
    List<Item> allItems = Provider.of<ItemStore>(context, listen: false).items;
    for (Item item in allItems) {
      if (widget.brand == item.brand) {
        brandItems.add(item);
      }
    }
    log(widget.brand);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset(
                'assets/logos/eliya.png',
                // fit: BoxFit.contain,
                // height: 40,
              ),
              height: 50,
              width: 100
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () =>
                  {Navigator.of(context).popUntil((route) => route.isFirst)},
              icon: Icon(Icons.close)),
        ],
      ),

      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Consumer<ItemStore>(
                  // child not required
                  builder: (context, value, child) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.5),
                    itemBuilder: (_, index) => GestureDetector(
                        child: DesignerItemCard(brandItems[index]),
                        onTap: () {
                          log(brandItems[0].toString());
                            // log('About to rent ${value.brandItems[index].name}');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (ToRent(brandItems[index]))));
                        }),
                    itemCount: brandItems.length,
                  ),
                );
              }),
 
            ],
          )),
    );
  }
}
