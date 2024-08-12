import 'package:flutter/material.dart';
import 'package:unearthed/screens/browse/category_list_view.dart';
import 'package:unearthed/screens/browse/designer_list_view.dart';
import 'package:unearthed/screens/browse/occasion_grid_view.dart';
import 'package:unearthed/screens/browse/style_list_view.dart';
import 'package:unearthed/screens/profile/my_purchases_list.dart';
import 'package:unearthed/screens/profile/my_rentals.dart';
import 'package:unearthed/screens/profile/my_rentals_list.dart';
import 'package:unearthed/shared/styled_text.dart';

class MyTransactions extends StatelessWidget {
  const MyTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            // indicatorColor: Colors.black,
            // labelColor: Colors.black,
            tabs: [
              Tab(text: 'Rentals'),
              Tab(text: 'Purchases'),
            ],
          ),
          title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('TRANSACTIONS', style: TextStyle(fontSize: 22))
              ]),
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
        body:  TabBarView(
          children: [
            MyRentalsList(),
            MyPurchasesList(),
          ],
        ),
      ),
    );
  }
}
