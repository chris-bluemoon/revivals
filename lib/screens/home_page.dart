import 'package:flutter/material.dart';
import 'package:unearthed/screens/home/home.dart';
import 'package:unearthed/services/dress_store.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    Provider.of<DressStore>(context, listen: false)
      .fetchDressesOnce();

    super.initState();
  }

  int _pageIndex = 0;

  final _pages = [
    Home(),
    Center(child: Text('Browse'),),
    Center(child: Text('Favourites'),),
    Center(child: Text('Profile'),)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Row(
          // TODO: Image is not centered in appbar with back arrow
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logos/unearthed_logo_2.png', 
                // 'assets/logos/unearthed_collections.png', 
                 height: 200,
                                    ),
              ]),
      ),

      body: _pages[_pageIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _pageIndex,
        onTap: (int index) {
          setState(
            () {
              _pageIndex = index;
            },
          );
        },
      ),
    );
  }
}