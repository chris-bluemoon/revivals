import 'package:flutter/material.dart';
import 'package:unearthed/screens/browse/category_list_view.dart';
import 'package:unearthed/screens/browse/designer_list_view.dart';
import 'package:unearthed/screens/browse/occasion_grid_view.dart';
import 'package:unearthed/screens/browse/style_list_view.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            // indicatorColor: Colors.black,
            // labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 12),
            tabs: [
              FittedBox(fit: BoxFit.contain, child: Tab(text: 'Occasion',)),
              Tab(text: 'Category'),
              Tab(text: 'Style'),
              Tab(text: 'Designer'),
            ],
          ),
          title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('BROWSE', style: TextStyle(fontSize: 22))
              ]),
        ),
        body:  TabBarView(
          children: [
            OccasionGridView(),
            const CategoryListView(),
            const StyleListView(),
            DesignerListView(),
          ],
        ),
      ),
    );
  }
}
