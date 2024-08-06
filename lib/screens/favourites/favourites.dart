import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/models/dress.dart';
import 'package:unearthed/screens/favourites/favourites_card.dart';
import 'package:unearthed/screens/new_arrivals/dress_card.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/screens/to_rent/to_rent.dart';
import 'package:uuid/uuid.dart';
import 'package:unearthed/screens/sign_up/google_sign_in.dart';

var uuid = const Uuid();

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {

@override
initState() {

  Provider.of<DressStore>(context, listen: false).populateFavourites();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Row(
          // TODO: Image is not centered in appbar with back arrow
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('WISH LIST', style: TextStyle(fontSize: 22))
              ]),
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
                    itemBuilder: (_, index) =>
                    GestureDetector(
                        child: FavouritesCard(value.favourites[index]),
                        onTap: () {
                          // if (Provider.of<DressStore>(context, listen: false).renters.length == 0) {
                            // log('Not logged in, cannot rent, redirecting');
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => (GoogleSignInScreen())));
                          // } else {
                            // log('About to rent ${value.dresses[index].name}');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (ToRent(value.favourites[index]))));
                          // }

                        }),
                    itemCount: value.favourites.length,
                  ),
                );
              }),
            ],
          )),
    );
  }
}
