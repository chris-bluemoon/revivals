import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unearthed/models/dress.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/screens/browse/designer_dress_card.dart';
import 'package:unearthed/screens/home/my_app_client.dart';
import 'package:unearthed/screens/new_arrivals/dress_card.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/screens/to_rent/to_rent.dart';
import 'package:uuid/uuid.dart';
import 'package:unearthed/screens/sign_up/google_sign_in.dart';

var uuid = const Uuid();

class DesignerDresses extends StatefulWidget {
  const DesignerDresses(this.brand, {super.key});

  final String brand;

  @override
  State<DesignerDresses> createState() => _DesignerDressesState();
}

class _DesignerDressesState extends State<DesignerDresses> {


 
    final List<Dress> brandDresses = [];

    @override
    initState() {
      // getCurrentUser();
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    // getCurrentUser();
    List<Dress> allDresses = Provider.of<DressStore>(context, listen: false).dresses;
    for (Dress dress in allDresses) {
      if (widget.brand == dress.brand) {
        brandDresses.add(dress);
      }
    }
    log(widget.brand);
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
              Consumer<DressStore>(
                  // child not required
                  builder: (context, value, child) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.5),
                    itemBuilder: (_, index) => GestureDetector(
                        child: DesignerDressCard(brandDresses[index]),
                        onTap: () {
                          log(brandDresses[0].toString());
                            // log('About to rent ${value.brandDresses[index].name}');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (ToRent(brandDresses[index]))));
                        }),
                    itemCount: brandDresses.length,
                  ),
                );
              }),
 
            ],
          )),
    );
  }
}
