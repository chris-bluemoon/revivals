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
        unselectedLabelStyle: TextStyle(fontSize: 10.0),
        selectedLabelStyle: TextStyle(fontSize: 10.0),
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
              _pageIndex = index;
            },
          );
        },
      ),
    );
  }
}