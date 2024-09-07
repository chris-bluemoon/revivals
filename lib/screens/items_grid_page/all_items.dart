import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/screens/sign_up/google_sign_in.dart';
import 'package:unearthed/screens/to_rent/to_rent.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/item_card.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class AllItems extends StatefulWidget {
  const AllItems({super.key});

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  void handleSubmit() {
    for (var i = 0; i < allItems.length; i++) {
      Provider.of<ItemStore>(context, listen: false).addItem(Item(
        id: uuid.v4(),
        type: allItems[i].type,
        bookingType: allItems[i].bookingType,
        occasion: allItems[i].occasion,
        dateAdded: allItems[i].dateAdded,
        style: allItems[i].style,
        name: allItems[i].name,
        brand: allItems[i].brand,
        colour: allItems[i].colour,
        size: allItems[i].size,
        rentPrice: allItems[i].rentPrice,
        buyPrice: allItems[i].buyPrice,
        rrp: allItems[i].rrp,
        description: allItems[i].description,
        bust: allItems[i].bust,
        waist: allItems[i].waist,
        hips: allItems[i].hips,
        longDescription: allItems[i].longDescription,
        imageId: allItems[i].imageId,
        // isFav: allItems[i].isFav,
    ));
    }

  }


    @override
    initState() {
      // getCurrentUser();
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;
    // getCurrentUser();
    // List<Item> itemList = Provider.of<ItemStore>(context, listen: false).items;
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: width * 0.15,
        title: const StyledTitle("ALL ITEMS"),
        // Image.asset(
          // 'assets/logos/unearthed_logo_3.png',
          // height: 200,
          // height: width * 0.15,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: width*0.06),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () =>
        //           {Navigator.of(context).popUntil((route) => route.isFirst)},
        //       icon: Icon(Icons.close, size: width*0.06)),
        // ],
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
                        child: ItemCard(value.items[index]),
                        onTap: () {
                          if (Provider.of<ItemStore>(context, listen: false).renters.length == 0) {
                            log('Not logged in, cannot rent, redirecting');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const GoogleSignInScreen())));
                          } else {
                            log('About to rent ${value.items[index].name}');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (ToRent(value.items[index]))));
                          }

                        }),
                    itemCount: value.items.length,
                  ),
                );
              }),
              TextButton(
                onPressed: () {
                  handleSubmit();
                  // addItemsAll();
                },
                child: const Text('ADD'),
              )
            ],
          )),
    );
  }
}
