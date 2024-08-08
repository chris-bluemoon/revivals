import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/screens/home/my_app_client.dart';
import 'package:unearthed/screens/new_arrivals/item_card.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/screens/to_rent/to_rent.dart';
import 'package:uuid/uuid.dart';
import 'package:unearthed/screens/sign_up/google_sign_in.dart';

var uuid = const Uuid();

class NewArrivals extends StatefulWidget {
  const NewArrivals({super.key});

  @override
  State<NewArrivals> createState() => _NewArrivalsState();
}

class _NewArrivalsState extends State<NewArrivals> {
  void handleSubmit() {
    for (var i = 0; i < myItems.length; i++) {
      log(myItems[i].name);
      Provider.of<ItemStore>(context, listen: false).addItem(Item(
        id: uuid.v4(),
        type: myItems[i].type,
        name: myItems[i].name,
        brand: myItems[i].brand,
        colour: myItems[i].colour,
        size: myItems[i].size,
        rentPrice: myItems[i].rentPrice,
        rrp: myItems[i].rrp,
        description: myItems[i].description,
        bust: myItems[i].bust,
        waist: myItems[i].waist,
        hips: myItems[i].hips,
        longDescription: myItems[i].longDescription,
        // isFav: myItems[i].isFav,
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
    // getCurrentUser();
    List<Item> itemList = Provider.of<ItemStore>(context, listen: false).items;
    for (Item i in itemList) {
      log(i.name);
    }
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logos/unearthed_logo_2.png',
              fit: BoxFit.contain,
              height: 200,
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
                        child: ItemCard(value.items[index]),
                        onTap: () {
                          if (Provider.of<ItemStore>(context, listen: false).renters.length == 0) {
                            log('Not logged in, cannot rent, redirecting');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (GoogleSignInScreen())));
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
