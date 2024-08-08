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

class CategoryItems extends StatefulWidget {
  const CategoryItems(this.type, {super.key});

  final String type;

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {


 
    final List<Item> categoryItems = [];

    @override
    initState() {
      // getCurrentUser();
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    // getCurrentUser();
    List<Item> allItemes = Provider.of<ItemStore>(context, listen: false).items;
    for (Item i in allItemes) {
      if (widget.type == i.type) {
        categoryItems.add(i);
      }
    }
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
                        child: DesignerItemCard(categoryItems[index]),
                        onTap: () {
                          log(categoryItems[0].toString());
                            // log('About to rent ${value.brandItemes[index].name}');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (ToRent(categoryItems[index]))));
                        }),
                    itemCount: categoryItems.length,
                  ),
                );
              }),
 
            ],
          )),
    );
  }
}
