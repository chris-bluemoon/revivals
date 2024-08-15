import 'package:flutter/material.dart';
import 'package:unearthed/screens/profile/my_purchases_list.dart';
import 'package:unearthed/screens/profile/my_rentals_list.dart';

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
              Text('BOOKINGS', style: TextStyle(fontSize: 22))
              ]),
                      leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () =>
                  {Navigator.of(context).popUntil((route) => route.isFirst)},
              icon: const Icon(Icons.close)),
        ],
        ),
        body:  const TabBarView(
          children: [
            MyRentalsList(),
            MyPurchasesList(),
          ],
        ),
      ),
    );
  }
}
