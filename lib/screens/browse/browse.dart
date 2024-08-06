import 'package:flutter/material.dart';
import 'package:unearthed/shared/styled_text.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              const Tab(text: 'Occasion'),
              const Tab(text: 'Category'),
              const Tab(text: 'Style'),
              const Tab(text: 'Designer'),
            ],
          ),
          title: const Row(
          // TODO: Image is not centered in appbar with back arrow
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('BROWSE', style: TextStyle(fontSize: 22))
              ]),
        ),
        body: TabBarView(
          children: [
            StyledBody('Occasion'),
            StyledBody('Category'),
            StyledBody('Style'),
            StyledBody('Designer'),
          ],
        ),
      ),
    );
  }
}
