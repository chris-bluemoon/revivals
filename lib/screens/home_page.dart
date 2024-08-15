import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/screens/browse/browse.dart';
import 'package:unearthed/screens/favourites/favourites.dart';
import 'package:unearthed/screens/home/home.dart';
import 'package:unearthed/screens/profile/profile.dart';
import 'package:unearthed/screens/sign_up/google_sign_in.dart';
import 'package:unearthed/services/class_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    Provider.of<ItemStore>(context, listen: false)
      .fetchItemsOnce();
    Provider.of<ItemStore>(context, listen: false)
      .fetchItemRentersOnce();
    Provider.of<ItemStore>(context, listen: false)
      .fetchRentersOnce();
      
    // Provider.of<ItemStore>(context, listen: false).addAllFavourites();
    List<Renter> renters = Provider.of<ItemStore>(context, listen: false).renters;
    log('Renters list:');
    log(renters.toString());
    
    // getCurrentUser();
    super.initState();
  }

  int _pageIndex = 0;

  bool loggedIn = false;

  final _pages = [
    const Home(),
    const Browse(),
    const Favourites(),
    const Profile(),
  ];

// Future<dynamic> getCurrentUser() async {
//   User? _user = await FirebaseAuth.instance.currentUser;
// // Firebase.Auth.FirebaseUser user = auth.CurrentUser;
//     // User? asda = FirebaseAuth.instance.currentUser;
//     if(_user != null) {
//       loggedIn = true;
//     List<Renter> renters = Provider.of<ItemStore>(context, listen: false).renters;
    
//     // Provider.of<ItemStore>(context, listen: false).fetchRentersOnce();
//     for (Renter r in renters) {
//       if (r.email == _user.email) {
//         Provider.of<ItemStore>(context, listen: false).assignUser(r);
//         log('User ${r.email} found in DB, just assigned to _user');
//       } 
//     }
//     } else {
//       log('Not logged in');
//       loggedIn = false;
//     };
//     return _user;
//     // return asda;
//   }

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
        unselectedLabelStyle: const TextStyle(fontSize: 10.0, color: Colors.black),
        selectedLabelStyle: const TextStyle(fontSize: 10.0, color: Colors.grey),
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
              // getCurrentUser();
              _pageIndex = index;
              bool loggedIn = Provider.of<ItemStore>(context, listen: false).loggedIn;
              log('Logged in is set to $loggedIn');
              if (index == 3 && loggedIn == false) {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const GoogleSignInScreen())));
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => (LoginPage())));
                _pageIndex = 0;
              }
            },
          );
        },
      ),
    );
  }
}