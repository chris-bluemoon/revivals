import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/models/dress.dart';
import 'package:unearthed/screens/new_arrivals/dress_card.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/screens/to_rent/to_rent.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class NewArrivals extends StatefulWidget {
  const NewArrivals({super.key});

  @override
  State<NewArrivals> createState() => _NewArrivalsState();
}

class _NewArrivalsState extends State<NewArrivals> {
  void handleSubmit() {
    Provider.of<DressStore>(context, listen: false).addDress(Dress(
      id: uuid.v4(),
      name: 'Sheena',
      brand: 'LEXI',
      size: 0,
      rentPrice: 0,
      rrp: 0,
    ));
  }

  @override
  Widget build(BuildContext context) {
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
      // appBar: AppBar(
      //           actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.close),
      //       onPressed: () {
      //         // handle the press
      //       },
      //     ),
      //   ],
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     // TODO: Title image Not quite centered
      //     mainAxisSize: MainAxisSize.min,
      //       children: [
      //         Image.asset(
      //           'assets/logos/unearthed_collections.png',
      //            height: 300,
      //                               ),
      //         ]),
      // ),
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
                        child: DressCard(value.dresses[index]),
                        onTap: () {
                          log('Tapped ${value.dresses[index].name}');
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => (ToRent(value.dresses[index]))));

                        }),
                    itemCount: value.dresses.length,
                  ),
                );
              }),
              TextButton(
                onPressed: () {
                  handleSubmit();
                },
                child: const Text('ADD'),
              )
            ],
          )),
    );
  }
}
