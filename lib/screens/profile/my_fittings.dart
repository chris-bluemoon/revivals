import 'package:flutter/material.dart';
import 'package:unearthed/screens/profile/my_history_fittings_list.dart';
import 'package:unearthed/screens/profile/my_upconing_fittings_list.dart';
import 'package:unearthed/shared/styled_text.dart';

class MyFittings extends StatelessWidget {
  const MyFittings({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: width * 0.2,
          // automaticallyImplyLeading: false,
          bottom: TabBar(
            // indicatorColor: Colors.black,
            // labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: width*0.03),
            tabs: const [
              Tab(text: 'UPCOMING'),
              Tab(text: 'HISTORY'),
            ],
          ),
          title: const StyledTitle('FITTING SESSIONS'),
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
        body:  const TabBarView(
          children: [
            MyUpcomingFittingsList(),
            MyHistoryFittingsList(),
          ],
        ),
      ),
    );
  }
}
