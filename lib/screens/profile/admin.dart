import 'package:flutter/material.dart';
import 'package:unearthed/screens/profile/my_purchases_admin_list.dart';
import 'package:unearthed/screens/profile/my_rentals_admin_list.dart';
import 'package:unearthed/shared/styled_text.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: width * 0.2,
          bottom: TabBar(
            // indicatorColor: Colors.black,
            // labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: width*0.03),
            tabs: const [
              Tab(text: 'RENTALS'),
              Tab(text: 'PURCHASES'),
            ],
          ),
          title: const StyledTitle('ADMIN CHECK'),
                      leading: IconButton(
          icon: Icon(Icons.chevron_left, size: width*0.08),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () =>
        //           {Navigator.of(context).popUntil((route) => route.isFirst)},
        //       icon: Icon(Icons.close, size: width*0.06)),
        // ],
        ),
        body: const TabBarView(
            children: [
              MyRentalsAdminList(),
              MyPurchasesAdminList(),
            ],
          )
        ),
      );
  }
}
