import 'package:flutter/material.dart';
import 'package:unearthed/screens/browse/category_list_view.dart';
import 'package:unearthed/screens/browse/designer_list_view.dart';
import 'package:unearthed/screens/browse/occasion_grid_view.dart';
import 'package:unearthed/screens/browse/style_list_view.dart';
import 'package:unearthed/shared/styled_text.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: width * 0.15,
          bottom: TabBar(
            // indicatorColor: Colors.black,
            // labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: width*0.03),
            tabs: const [
              FittedBox(fit: BoxFit.contain, child: Tab(text: 'Occasion',)),
              Tab(text: 'Category'),
              Tab(text: 'Style'),
              Tab(text: 'Designer'),
            ],
          ),
          title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
             StyledTitle('BROWSE'),
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
