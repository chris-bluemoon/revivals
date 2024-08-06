import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unearthed/models/dress.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/screens/home/my_app_client.dart';
import 'package:unearthed/screens/new_arrivals/dress_card.dart';
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
    for (var i = 0; i < myDresses.length; i++) {
      log(myDresses[i].name);
      Provider.of<DressStore>(context, listen: false).addDress(Dress(
        id: uuid.v4(),
        name: myDresses[i].name,
        brand: myDresses[i].brand,
        colour: myDresses[i].colour,
        size: myDresses[i].size,
        rentPrice: myDresses[i].rentPrice,
        rrp: myDresses[i].rrp,
        description: myDresses[i].description,
        bust: myDresses[i].bust,
        waist: myDresses[i].waist,
        hips: myDresses[i].hips,
        longDescription: myDresses[i].longDescription,
        // isFav: myDresses[i].isFav,
    ));
    }

  }

    Future<dynamic> getCurrentUser() async {
      User? _user = await FirebaseAuth.instance.currentUser;
      if (_user != null) {
        log('Logged in with displayName: ${_user.displayName}');
        log('and email: ${_user.email}');
        List<Renter> renters =
            Provider.of<DressStore>(context, listen: false).renters;
        log('Current Provider list is: ${renters.toString()}');
        for (Renter r in renters) {
          log('Checking google email: ${_user.email}');
          log('again database email: ${r.email}');
          if (r.email == _user.email) {
            Provider.of<DressStore>(context, listen: false).assignUser(r);
            log('User ${r.email} found in DB, just assigned to _user');
          }
        }
      } else {
        log('Not logged in');
        // loggedIn = false;
      }
      ;
      return _user;
      // return asda;
    }

    @override
    initState() {
      getCurrentUser();
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    // getCurrentUser();
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
                          if (Provider.of<DressStore>(context, listen: false).renters.length == 0) {
                            log('Not logged in, cannot rent, redirecting');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (GoogleSignInScreen())));
                          } else {
                            log('About to rent ${value.dresses[index].name}');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (ToRent(value.dresses[index]))));
                          }

                        }),
                    itemCount: value.dresses.length,
                  ),
                );
              }),
              TextButton(
                onPressed: () {
                  handleSubmit();
                  // addDressesAll();
                },
                child: const Text('ADD'),
              )
            ],
          )),
    );
  }
}
