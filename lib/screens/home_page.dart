import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/screens/browse/browse.dart';
import 'package:unearthed/screens/home/home.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/send_line.dart';
import 'package:unearthed/shared/send_whatsapp.dart';
import 'package:unearthed/shared/sms.dart';
import 'package:unearthed/screens/sign_up/sign_up.dart';
import 'package:unearthed/screens/sign_up/google_sign_in.dart';
import 'package:unearthed/screens/profile/profile.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/renter.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    Provider.of<DressStore>(context, listen: false)
      .fetchDressesOnce();
    Provider.of<DressStore>(context, listen: false)
      .fetchDressRentersOnce();
    Provider.of<DressStore>(context, listen: false)
      .fetchRentersOnce();

    getCurrentUser();
    super.initState();
  }

  int _pageIndex = 0;

  bool loggedIn = false;

  final _pages = [
    Home(),
    Browse(),
    Center(child: Text('Favourites'),),
    Profile(),
  ];

Future<dynamic> getCurrentUser() async {
User? _user = await FirebaseAuth.instance.currentUser;
// Firebase.Auth.FirebaseUser user = auth.CurrentUser;
    // User? asda = FirebaseAuth.instance.currentUser;
    if(_user != null) {
      log('Logged in with displayName: ${_user.displayName}');
      log('and email: ${_user.email}');
      loggedIn = true;
      // Get correct user from database
    //  Provider.of<DressStore>(context, listen: false).fetchRentersOnce(_user.email!);
      // Provider.of<DressStore>(context, listen: false).fetchRentersOnce('uneartheduser@gmail.com');
      // Provider.of<DressStore>(context, listen: false).fetchRentersOnce(_user.email!);
      // Then add to Provider
    //   Provider.of<DressStore>(context, listen: false).addRenterAppOnly(Renter(
    //     id: uuid.v4(),
    //     email: _user.email!,
    //     name: _user.displayName!,
    //     size: 0,
    //     address: 'Thailand',
    //     phoneNum: 0,
    // ));
    List<Renter> renters = Provider.of<DressStore>(context, listen: false).renters;
    
    log('Current Provider list is: ${renters.toString()}');
    for (Renter r in renters) {
      log('Checking google email: ${_user.email}');
      log('again database email: ${r.email}');
      if (r.email == _user.email) {
        Provider.of<DressStore>(context, listen: false).assignUser(r);
        log('User ${r.email} found in DB, adding to current app user');
      } 
    }
    } else {
      log('Not logged in');
      loggedIn = false;
    };
    return _user;
    // return asda;
  }

// final User user = auth.currentUser;
// if (_user.displayName == null) 
// log("User: ${_user.displayName ?? "None"}");
// return _user;}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // centerTitle: true,
      //   title: Row(
      //     // TODO: Image is not centered in appbar with back arrow
      //     mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Image.asset(
      //           'assets/logos/unearthed_logo_2.png', 
      //           // 'assets/logos/unearthed_collections.png', 
      //            height: 200,
      //                               ),
      //         ]),
      // ),

      body: _pages[_pageIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(fontSize: 10.0, color: Colors.black),
        selectedLabelStyle: TextStyle(fontSize: 10.0, color: Colors.grey),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Icon(Icons.home_outlined, size: 18.0),
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Icon(Icons.menu_book_outlined, size: 18.0),
            ),
            label: 'BROWSE',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Icon(Icons.favorite_border, size: 18.0),
            ),
            label: 'FAVOURITES',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Icon(Icons.account_circle_outlined, size: 18.0),
            ),
            label: 'PROFILE'
          ),
        ],
        // selectedLabelStyle: TextStyle(color: Colors.blue,fontSize: 14),
        currentIndex: _pageIndex,
        onTap: (int index) {
          setState(
            () {
              getCurrentUser();
              _pageIndex = index;
              if (index == 3 && loggedIn == false) {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const GoogleSignInScreen())));
                _pageIndex = 0;
              }
            },
          );
        },
      ),
    );
  }
}